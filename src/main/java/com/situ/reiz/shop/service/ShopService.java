package com.situ.reiz.shop.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.cart.domain.Cart;
import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.order.domain.Order;
import com.situ.reiz.order.domain.OrderDetail;
import com.situ.reiz.product.domain.Product;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.wish.domain.Wish;

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
	 * @Title: doUserLoginOut 
	 * @Description:(用户登出)
	 * @param session
	 * @return
	 */
	Integer doUserLoginOut(HttpSession session);

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

	/**
	 * @Title: doAddWish 
	 * @Description:(加入收藏)
	 * @param userCode
	 * @param proCode
	 * @return
	 */
	Integer doAddWish(String userCode, String proCode);

	/**
	 * @Title: findWishList 
	 * @Description:(查询收藏列表)
	 * @param userCode
	 * @return
	 */
	List<Wish> findWishList(String userCode);

	/**
	 * @Title: removeWish 
	 * @Description:(移除收藏)
	 * @param rowId
	 * @return
	 */
	Integer removeWish(Long rowId);

	/**
	 * @Title: doAddCart 
	 * @Description:(加入到购物车)
	 * @param userCode
	 * @param proId
	 * @return
	 */
	Integer doAddCart(String userCode, Long proId, HttpSession session);

	/**
	 * @Title: findAllCartData 
	 * @Description:(根据用户CODE查询所有的购物车数据)
	 * @param userCode
	 * @return
	 */
	List<Cart> findAllCartData(String userCode);

	/**
	 * @Title: removeCart 
	 * @Description:(移除购物车)
	 * @param rowId
	 * @return
	 */
	Integer removeCart(Long rowId, HttpSession session);

	/**
	 * @Title: doAddOrder 
	 * @Description:(增加订单信息)
	 * @param order
	 * @param userCode
	 * @param session
	 * @return
	 */
	Integer doAddOrder(Order order, String userCode, HttpSession session);

	/**
	 * @Title: findOrderByUser 
	 * @Description:(根据用户查询订单列表)
	 * @param userCode
	 * @return
	 */
	List<Order> findOrderByUser(String userCode);

	/**
	 * @Title: findOrderDetailList 
	 * @Description:(查看订单的详情)
	 * @param orderId
	 * @return
	 */
	List<OrderDetail> findOrderDetailList(Long orderId);

	/**
	 * @Title: checkUserPass 
	 * @Description:(检查用户原密码是否正确)
	 * @param fieldParam
	 * @return
	 */
	String checkUserPass(String userCode, FieldParam fieldParam);

	/**
	 * @Title: doUpdateUserPass 
	 * @Description:(更新用户密码)
	 * @param userCode
	 * @param userPass
	 * @return
	 */
	Integer doUpdateUserPass(String userCode, String userPass);
}
