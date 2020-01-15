package com.situ.reiz.shop.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.address.domain.Address;
import com.situ.reiz.address.service.AddressService;
import com.situ.reiz.area.domain.Area;
import com.situ.reiz.area.service.AreaService;
import com.situ.reiz.base.FieldParam;
import com.situ.reiz.order.domain.Order;
import com.situ.reiz.shop.service.ShopService;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.ContextUtils;

/**
 * @ 前台商城的Controller层
 * 
 * @author wxinpeng
 */
@Controller
public class ShopController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final Log LOG = LogFactory.getLog(ShopController.class);
	// 商城首页
	private static final String PAGE_SHOP_INDEX = "shop/index";
	// 商城购物车
	private static final String PAGE_SHOP_CART = "shop/cart";
	// 商城关于我们页面
	private static final String PAGE_SHOP_ABOUT_US = "shop/about-us";
	// 商城 联系我们页面
	private static final String PAGE_SHOP_CONTACT_US = "shop/contact-us";
	// 商城 收藏页面
	private static final String PAGE_SHOP_WISH_LIST = "shop/wishlist";
	// 商城 我的后台
	private static final String PAGE_SHOP_MY_ACCOUNT = "shop/my-account";
	// 商城 产品列表
	private static final String PAGE_SHOP_SHOP_LIST = "shop/shop";
	// 登录注册页面
	private static final String PAGE_SHOP_LOGIN_REGISTER = "shop/login-register";
	// 商品详细页面
	private static final String PAGE_SHOP_PRODUCT_INFO = "shop/product-details";
	// 商城 结算页面
	private static final String PAGE_SHOP_CHECK_OUT = "shop/checkout";
	// 商城-头部购物车数据页面
	private static final String PAGE_SHOP_HEAD_CART = "shop/head_cart";
	// 商城 - 订单列表数据
	private static final String PAGE_SHOP_ORDER_LIST = "shop/order/order_list";
	//
	private static final String PAGE_SHOP_ORDER_DETAIL = "shop/order/order_detail_list";
	// 面向接口编程
	@Autowired
	private ShopService shopService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private AddressService addressService;

	/**
	 * @进商城首页
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(path = { "/", "/index" })
	public ModelAndView goIndex(ModelAndView modelAndView, @CookieValue(value = "user.reiz.com", required = false) String cookieInfo, HttpSession session) {
		LOG.debug(cookieInfo);
		// 检测是否能完成自动登录
		shopService.autoLogin(cookieInfo, session);
		modelAndView.setViewName(PAGE_SHOP_INDEX);
		return modelAndView;
	}

	/**
	 * @进购物车页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/cart")
	public ModelAndView goCart(ModelAndView modelAndView) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		modelAndView.addObject("cartList", shopService.findAllCartData(userCode));
		modelAndView.setViewName(PAGE_SHOP_CART);
		return modelAndView;
	}

	/**
	 * @进关于我们页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/about")
	public ModelAndView goAuboutUS(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_SHOP_ABOUT_US);
		return modelAndView;
	}

	/**
	 * @进联系我们页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/contact")
	public ModelAndView goContactUS(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_SHOP_CONTACT_US);
		return modelAndView;
	}

	/**
	 * @进收藏页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/wishlist")
	public ModelAndView goWishList(ModelAndView modelAndView) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		modelAndView.addObject("wishList", shopService.findWishList(userCode));
		modelAndView.setViewName(PAGE_SHOP_WISH_LIST);
		return modelAndView;
	}

	/**
	 * @进我的后台页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/account")
	public ModelAndView goMyAccont(ModelAndView modelAndView) {
		modelAndView.addObject("area1List", areaService.findAreaByParentCode(Area.DEFAULT_PARENT_CODE));
		modelAndView.setViewName(PAGE_SHOP_MY_ACCOUNT);
		return modelAndView;
	}

	/**
	 * @进产品列表
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/shop")
	public ModelAndView goShopList(ModelAndView modelAndView) {
		modelAndView.addObject("menuList", shopService.findAllMenu());
		modelAndView.addObject("productList", shopService.findAllProduct());
		modelAndView.setViewName(PAGE_SHOP_SHOP_LIST);
		return modelAndView;
	}

	/**
	 * @Title: goProductInfo 
	 * @Description:(进商品详细页面)
	 * @param rowId
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/product-details/{rowId}")
	public ModelAndView goProductInfo(@PathVariable Long rowId, ModelAndView modelAndView) {
		modelAndView.addObject("product", shopService.findProductById(rowId));
		modelAndView.setViewName(PAGE_SHOP_PRODUCT_INFO);
		return modelAndView;
	}

	/**
	 * @进登录注册页面
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/login_register")
	public ModelAndView goLoginOrRegister(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_SHOP_LOGIN_REGISTER);
		return modelAndView;
	}

	/**
	 * @Title: goLoginOut 
	 * @Description:(执行退出，并重定向到商城首页)
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginout")
	public String goLoginOut(HttpSession session) {
		this.shopService.doUserLoginOut(session);
		//通过 返回"redirect:url"执行重定向。
		return "redirect:index";
	}

	/**
	 * 执行用户登录 测试代码修改
	 * @return 1:成功;2:用户密码或密码错误;3:用户被锁定;
	 */
	@ResponseBody
	@RequestMapping("/doUserLogin")
	public Integer doUserLogin(String userCode, String userPass, Integer isRemember, HttpServletRequest request, HttpServletResponse response) {
		return this.shopService.doUserLogin(userCode, userPass, isRemember, request, response);
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doUserRegister")
	public Long doUserRegister(User user) {
		return this.shopService.doUserRegister(user);
	}

	/**
	 * @Title: doUserLoginOut 
	 * @Description:(用户登出)
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doUserLoginOut")
	public Integer doUserLoginOut(HttpSession session) {
		return this.shopService.doUserLoginOut(session);
	}

	/**
	 * @Title: doAddWish 
	 * @Description:(收藏)
	 * @param proCode
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addwish/{active}/{proCode}")
	public Integer doAddWish(@PathVariable Integer active, @PathVariable String proCode, HttpSession session) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return this.shopService.doAddWish(userCode, proCode, active, session);
	}

	/**
	 * @Title: removeWish 
	 * @Description:(移除收藏)
	 * @param rowId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/removewish/{rowId}")
	public Integer removeWish(@PathVariable Long rowId, HttpSession session) {
		return this.shopService.removeWish(rowId, session);
	}

	/**
	 * @Title: doAddCart 
	 * @Description:(加入购物车)
	 * @param proId
	 * @return 购物车的数量
	 */
	@ResponseBody
	@RequestMapping("/addcart/{proId}/{orderCount}")
	public Integer doAddCart(@PathVariable Long proId,@PathVariable Integer orderCount, HttpSession session) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return this.shopService.doAddCart(userCode, proId,orderCount, session);
	}

	/**
	 * @Title: removeCart 
	 * @Description:(移除购物车)
	 * @param rowId
	 * @return 购物车的数量
	 */
	@ResponseBody
	@RequestMapping("/removecart/{rowId}")
	public Integer removeCart(@PathVariable Long rowId, HttpSession session) {
		return this.shopService.removeCart(rowId, session);
	}

	/**
	 * @Title: findHeadCartData 
	 * @Description:(请求头部的购物车数据)
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/headcart")
	public ModelAndView findHeadCartData(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_SHOP_HEAD_CART);
		return modelAndView;
	}

	/**
	 * @Title: updateCartCount 
	 * @Description:(更新购物车信息)
	 * @param rowId
	 * @param orderCount
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/putcart/{rowId}/{count}")
	public Integer updateCartCount(@PathVariable("rowId") Long rowId, @PathVariable("count") Integer orderCount, HttpSession session) {
		return shopService.updateCartCount(rowId, orderCount, session);
	}

	/**
	 * @Title: goCheckOut 
	 * @Description:(进结算页面)
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/checkout")
	public ModelAndView goCheckOut(ModelAndView modelAndView) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		modelAndView.addObject("addressList", addressService.findAddressByUser(userCode));
		modelAndView.setViewName(PAGE_SHOP_CHECK_OUT);
		return modelAndView;
	}

	/**
	 * @Title: doAddOreder 
	 * @Description:(增加订单信息)
	 * @param order
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addorder")
	public Integer doAddOreder(Order order, HttpSession session) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return shopService.doAddOrder(order, userCode, session);
	}

	/**
	 * @Title: findOrderList 
	 * @Description:(查询订单的信息)
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/orderlist")
	public ModelAndView findOrderList(ModelAndView modelAndView) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		modelAndView.addObject("orderList", shopService.findOrderByUser(userCode));
		modelAndView.setViewName(PAGE_SHOP_ORDER_LIST);
		return modelAndView;
	}

	/**
	 * @Title: findOrderDetailList 
	 * @Description:(订单的详情)
	 * @param orderId
	 * @param modelAndView
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/orderdetail/{orderId}")
	public ModelAndView findOrderDetailList(@PathVariable Long orderId, ModelAndView modelAndView) {
		Order order = shopService.findOrderById(orderId);
		Address address = shopService.findAddressById(order.getAddressId());
		modelAndView.addObject("order", order);
		modelAndView.addObject("address", address);
		modelAndView.addObject("orderDetailList", shopService.findOrderDetailList(orderId));
		modelAndView.setViewName(PAGE_SHOP_ORDER_DETAIL);
		return modelAndView;
	}

	/**
	 * @Title: checkUserPass 
	 * @Description:(检查用户密码是否正确)
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkUserPass")
	public String checkUserPass(FieldParam fieldParam) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return shopService.checkUserPass(userCode, fieldParam);
	}

	/**
	 * @Title: doUpdateUserPass 
	 * @Description:(修改密码)
	 * @param userPass
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/doputpass")
	public Integer doUpdateUserPass(String userPass) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return shopService.doUpdateUserPass(userCode, userPass);
	}
}
