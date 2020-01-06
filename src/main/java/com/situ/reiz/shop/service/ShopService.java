package com.situ.reiz.shop.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.user.domain.User;

public interface ShopService {
	/**
	 * 执行用户登录
	 * 
	 * @param userCode
	 * @param userPass
	 * @param isRemember
	 * @param session
	 * @return
	 */
	Integer doUserLogin(String userCode, String userPass, Integer isRemember, HttpServletRequest request, HttpServletResponse response);

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	Long doUserRegister(User user);

	/**
	 * 根据Cookie信息完成自动登录
	 * 
	 * @param cookiInfo
	 */
	void autoLogin(String cookiInfo, HttpSession session);

	/**
	 * @Title: findAllMenu 
	 * @Description:(查询所有的目录数据)
	 * @return
	 */
	List<Menu> findAllMenu();

	/**
	 * @Title: findAllProduct 
	 * @Description:(查询所有的商品)
	 * @return
	 */
	List<Product> findAllProduct();
}
