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

import com.situ.reiz.area.domain.Area;
import com.situ.reiz.area.service.AreaService;
import com.situ.reiz.shop.service.ShopService;
import com.situ.reiz.user.domain.User;

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
	// 面向接口编程
	@Autowired
	private ShopService shopService;
	@Autowired
	private AreaService areaService;

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

	@RequestMapping("/product-details/{rowId}")
	public ModelAndView goProductInfo(@PathVariable Long rowId, ModelAndView modelAndView) {
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
	 * 执行用户登录
	 * 
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
}
