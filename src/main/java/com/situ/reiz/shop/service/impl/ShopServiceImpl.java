package com.situ.reiz.shop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.cart.dao.CartDao;
import com.situ.reiz.cart.domain.Cart;
import com.situ.reiz.menu.dao.MenuDao;
import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.order.dao.OrderDao;
import com.situ.reiz.order.dao.OrderDetailDao;
import com.situ.reiz.order.domain.Order;
import com.situ.reiz.order.domain.OrderDetail;
import com.situ.reiz.product.dao.ProductDao;
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.shop.service.ShopService;
import com.situ.reiz.user.dao.UserDao;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.util.CalendarUtils;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.JSONUtils;
import com.situ.reiz.util.MD5Utils;
import com.situ.reiz.util.StringUtils;
import com.situ.reiz.wish.dao.WishDao;
import com.situ.reiz.wish.domain.Wish;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private WishDao wishDao;
	@Autowired
	private CartDao cartDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderDetailDao orderDetailDao;

	/**
	 * 根据Cookie信息完成自动登录
	 * 
	 * @param cookiInfo
	 */
	@Override
	public void autoLogin(String cookieInfo, HttpSession session) {
		if (StringUtils.isNotEmpty(cookieInfo)) {
			String[] array = cookieInfo.split(":");
			if (StringUtils.isNotEmpty(array[0]) && StringUtils.isNotEmpty(array[1])) {
				User user = this.userDao.findByCodeAndRowId(array[0], Long.parseLong(array[1]));
				if (user != null && user.getIsLock() == 0) {
					session.setAttribute(ConfigUtils.SESSION_USER_LOGIN, user);
				}
			}
		}

	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	@Override
	public Long doUserRegister(User user) {
		user.setUserPass(MD5Utils.encode(user.getUserPass()));
		user.setUserKind(User.USER_KIND_SELLER);
		user.setIsLock(0);
		user.setActiveFlag(1);
		user.setCreateBy(ConfigUtils.SYS);
		user.setCreateDate(new Date());
		return userDao.save(user);
	}

	/**
	 * 执行用户登录
	 * 
	 * @param userCode
	 * @param userPass
	 * @param isRemember
	 * @param session
	 * @return 1:成功;2:用户密码或密码错误;3:用户被锁定;
	 */
	@Override
	public Integer doUserLogin(String userCode, String userPass, Integer isRemember, HttpServletRequest request, HttpServletResponse response) {
		Integer result = 0;
		User user = this.userDao.findByCodeAndPass(userCode, MD5Utils.encode(userPass));
		if (user != null) {
			Integer isLock = user.getIsLock();
			// 没有被锁定
			if (isLock == 0) {
				result = 1;
				HttpSession session = request.getSession();
				session.setAttribute(ConfigUtils.SESSION_USER_LOGIN, user);
				user.setLastLoginDate(new Date());
				user.setLastLoginIP(request.getLocalAddr());
				this.userDao.update(user);
				// 需要自动登录
				if (isRemember != null && isRemember == 1) {
					String cookieInfo = user.getUserCode() + ":" + user.getRowId();
					Cookie cookie = new Cookie(ConfigUtils.COOKIE_USER_NAME, cookieInfo);
					// seconds
					cookie.setMaxAge(60 * 60 * 24 * 7);
					response.addCookie(cookie);
				} else {
					// 删除Cookie
					Cookie cookie = new Cookie(ConfigUtils.COOKIE_USER_NAME, null);
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				//用户登录成功，尝试查询 用户的购物车信息放置到session中
				List<Cart> cartList = cartDao.findAllData(userCode);
				//用来存放商品的MAP Map<productId,Cart>
				Map<Long, Cart> cartMap = new HashMap<Long, Cart>();
				if (cartList != null) {
					for (Cart cart : cartList) {
						cartMap.put(cart.getProductId(), cart);
					}
				}
				session.setAttribute(ConfigUtils.SESSION_USER_CART, cartMap);
				//查询出 收藏的 数量
				Integer wishCount = this.wishDao.getCount(userCode);
				session.setAttribute(ConfigUtils.SESSION_COUNT_WISH, wishCount);
			} else if (isLock == 1) {// 用户被锁定
				result = 3;
			}

		} else {
			result = 2;
		}
		return result;
	}

	/** 
	 * @Title: findAllMenu 
	 * @Description:(findAllMenu)
	 * @return  
	 */
	@Override
	public List<Menu> findAllMenu() {
		List<Menu> menuList = new ArrayList<Menu>();
		List<Menu> menuAllList = this.menuDao.find();
		Map<Long, List<Menu>> menuMap = new HashMap<Long, List<Menu>>();
		if (menuAllList != null) {
			for (Menu menu : menuAllList) {
				Long parentId = menu.getParentId();
				List<Menu> list = menuMap.get(parentId);
				if (list == null) {
					list = new ArrayList<Menu>();
				}
				list.add(menu);
				menuMap.put(parentId, list);
			}
		}

		List<Menu> defaultMenuList = menuMap.get(Menu.DEFAULT_PARENT_ID);
		for (Menu menu : defaultMenuList) {
			Long rowId = menu.getRowId();
			List<Menu> childList = menuMap.get(rowId);
			if (childList != null && !childList.isEmpty()) {
				menu.setChildList(childList);
			}
			menuList.add(menu);
		}
		return menuList;
	}

	/**
	 * @Title: findAllProduct 
	 * @Description:(查询所有的商品)
	 * @return
	 */
	@Override
	public List<Product> findAllProduct() {
		return this.productDao.find();
	}

	/** 
	 * @Title: doUserLoginOut 
	 * @Description:(用户登出)
	 * @param session
	 * @return  
	 */
	@Override
	public Integer doUserLoginOut(HttpSession session) {
		session.removeAttribute(ConfigUtils.SESSION_USER_LOGIN);
		return 1;
	}

	@Override
	public Integer doAddWish(String userCode, String proCode) {
		Wish wish = this.wishDao.findByUserAndPro(userCode, proCode);
		if (wish == null) {
			wish = new Wish();
			wish.setUserCode(userCode);
			wish.setProCode(proCode);
			wish.setCreateBy(userCode);
			wish.setCreateDate(new Date());
			wish.setActiveFlag(1);
			this.wishDao.save(wish);
		}
		return 1;
	}

	/** 
	 * @Title: findWishList 
	 * @Description:(这里用一句话描述这个方法的作用)
	 * @param userCode
	 * @return  
	 */
	@Override
	public List<Wish> findWishList(String userCode) {
		return wishDao.findAllWish(userCode);
	}

	/**
	 * @Title: removeWish 
	 * @Description:(移除收藏)
	 * @param rowId
	 * @return
	 */
	@Override
	public Integer removeWish(Long rowId) {
		this.wishDao.delete(rowId);
		return 1;
	}

	/**
	 * @Title: doAddCart 
	 * @Description:(加入到购物车)
	 * @param userCode
	 * @param proId
	 * @return
	 */
	@Override
	public Integer doAddCart(String userCode, Long proId, HttpSession session) {
		//尝试从session中取出登录的时候放置的购物车的map
		//Map<商品ID,Cart>
		@SuppressWarnings("unchecked")
		Map<Long, Cart> cartMap = (Map<Long, Cart>) session.getAttribute(ConfigUtils.SESSION_USER_CART);
		if (cartMap != null) {
			//根据购买的商品ID从map中尝试取出已有的购买数量
			Cart cart = cartMap.get(proId);
			//如果取出的购买数量为null，则默认值初始化成0
			if (cart == null) {
				cart = new Cart();
				Product product = productDao.get(proId);
				if (product != null) {
					cart.setProCode(product.getProCode());
					cart.setProName(product.getProName());
					cart.setProPath(product.getProPath());
					cart.setOldPrice(product.getOldPrice());
					cart.setNewPrice(product.getNewPrice());
				}
				cart.setUserCode(userCode);
				cart.setProductId(proId);
				cart.setOrderCount(1);
				cart.setActiveFlag(1);
				cart.setCreateBy(userCode);
				cart.setCreateDate(new Date());
			} else {
				//将购买数量加一
				cart.setOrderCount(cart.getOrderCount() + 1);
			}

			//重新将商品ID，和购买数量放置到map中
			cartMap.put(proId, cart);
			//将这个全心的Map，再放置到session中，覆盖原session中的map数据。
			session.setAttribute(ConfigUtils.SESSION_USER_CART, cartMap);
		}
		//将购物车的数据持久化。
		//拿着用户CODE和商品ID到购物车的表中查询看是否有记录，如果有则更新数量+1，如果没有则新增。
		Cart cart = cartDao.getByCodeAndPro(userCode, proId);
		if (cart != null) {
			cartDao.updateOrderCount(cart.getRowId());
		} else {
			cart = new Cart();
			cart.setUserCode(userCode);
			cart.setProductId(proId);
			cart.setOrderCount(1);
			cart.setActiveFlag(1);
			cart.setCreateBy(userCode);
			cart.setCreateDate(new Date());
			cartDao.save(cart);
		}
		return cartMap.size();
	}

	/**
	 * @Title: findAllCartData 
	 * @Description:(根据用户CODE查询所有的购物车数据)
	 * @param userCode
	 * @return
	 */
	@Override
	public List<Cart> findAllCartData(String userCode) {
		return cartDao.findAllData(userCode);
	}

	/**
	 * @Title: removeCart 
	 * @Description:(移除购物车)
	 * @param rowId
	 * @return
	 */
	@Override
	public Integer removeCart(Long rowId, HttpSession session) {
		Cart cart = this.cartDao.get(rowId);
		//尝试从session的cartmap中移除这个商品相关的信息
		Long proId = cart.getProductId();
		//Map<商品ID,Cart>
		@SuppressWarnings("unchecked")
		Map<Long, Cart> cartMap = (Map<Long, Cart>) session.getAttribute(ConfigUtils.SESSION_USER_CART);
		cartMap.remove(proId);
		this.cartDao.delete(rowId);
		return cartMap.size();
	}

	/**
	 * @Title: doAddOrder 
	 * @Description:(增加订单信息)
	 * @param order
	 * @param userCode
	 * @param session
	 * @return
	 */
	@Override
	public Integer doAddOrder(Order order, String userCode, HttpSession session) {
		Date nowDate = new Date();
		order.setOrderNum(CalendarUtils.getShortDate());
		order.setOrderStatus(1);
		order.setActiveFlag(1);
		order.setUserCode(userCode);
		order.setCreateBy(userCode);
		order.setCreateDate(nowDate);
		orderDao.save(order);
		Long orderId = order.getRowId();
		List<OrderDetail> orderDetailList = new ArrayList<OrderDetail>();
		//Map<商品ID,Cart>
		@SuppressWarnings("unchecked")
		Map<Long, Cart> cartMap = (Map<Long, Cart>) session.getAttribute(ConfigUtils.SESSION_USER_CART);
		for (Long proId : cartMap.keySet()) {
			Cart cart = cartMap.get(proId);
			Integer orderCount = cart.getOrderCount();
			OrderDetail orderDetail = new OrderDetail(orderId, proId, orderCount, orderCount * cart.getNewPrice());
			orderDetail.setActiveFlag(1);
			orderDetail.setCreateBy(userCode);
			orderDetail.setCreateDate(nowDate);
			orderDetailList.add(orderDetail);
		}
		orderDetailDao.saveBatch(orderDetailList);
		//将购物车清空
		cartMap.clear();
		session.setAttribute(ConfigUtils.SESSION_USER_CART, cartMap);
		cartDao.deleteByUser(userCode);
		return 1;
	}

	/**
	 * @Title: findOrderByUser 
	 * @Description:(根据用户查询订单列表)
	 * @param userCode
	 * @return
	 */
	@Override
	public List<Order> findOrderByUser(String userCode) {
		return this.orderDao.findByUser(userCode);
	}

	/**
	 * @Title: findOrderDetailList 
	 * @Description:(查看订单的详情)
	 * @param orderId
	 * @return
	 */
	@Override
	public List<OrderDetail> findOrderDetailList(Long orderId) {
		return orderDetailDao.findByOrder(orderId);
	}

	/**
	 * @Title: checkUserPass 
	 * @Description:(检查用户原密码是否正确)
	 * @param fieldParam
	 * @return
	 */
	@Override
	public String checkUserPass(String userCode, FieldParam fieldParam) {
		String userPass = fieldParam.getFieldValue();
		User user = userDao.findByCodeAndPass(userCode, MD5Utils.encode(userPass));
		Boolean bool = user == null ? false : true;
		return JSONUtils.buildValidationInfo(fieldParam.getFieldId(), bool);
	}

	/**
	 * @Title: doUpdateUserPass 
	 * @Description:(更新用户密码)
	 * @param userCode
	 * @param userPass
	 * @return
	 */
	@Override
	public Integer doUpdateUserPass(String userCode, String userPass) {
		this.userDao.updatePass(userCode, MD5Utils.encode(userPass));
		return null;
	}

}
