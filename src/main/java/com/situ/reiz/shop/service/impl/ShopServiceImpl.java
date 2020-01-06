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

import com.situ.reiz.menu.dao.MenuDao;
import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.product.dao.ProductDao;
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.shop.service.ShopService;
import com.situ.reiz.user.dao.UserDao;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.MD5Utils;
import com.situ.reiz.util.StringUtils;

@Service
public class ShopServiceImpl implements ShopService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private ProductDao productDao;

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

}
