package com.situ.reiz.admin.controller;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.admin.service.AdminService;
import com.situ.reiz.util.ConfigUtils;
/**
 * 
 * @ClassName:AdminController 
 * @Description:(这是准备修改的代码)
 */
@Controller
public class AdminController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_ADMIN_INDEX = "admin/index";// 管理员后台首页
	private static final String APGE_ADMIN_LOGIN = "admin/login";// 管理员后台的登录页面
	@Autowired
	private AdminService adminService;

	/**
	 * 进管理员后台的首页
	 * 
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/admin")
	public ModelAndView goIndex(ModelAndView modelAndView, HttpSession session) {
		// 判断当前为登录状态
		if (session.getAttribute(ConfigUtils.SESSION_ADMIN_LOGIN) != null) {
			modelAndView.setViewName(PAGE_ADMIN_INDEX);
		} else {// 否则为非登录状态
			modelAndView.setViewName(APGE_ADMIN_LOGIN);
		}

		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/doAdminLogin")
	public Integer doAdminLogin(String userCode, String userPass, Integer isRemember, HttpServletRequest request,
			HttpServletResponse response) {
		return adminService.doAdminLogin(userCode, userPass, isRemember, request, response);
	}
}
