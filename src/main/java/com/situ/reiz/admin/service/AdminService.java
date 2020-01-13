package com.situ.reiz.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface AdminService {
	/**
	 * 管理员登录
	 * @param userCode
	 * @param userPass
	 * @param isRemeber
	 * @param request
	 * @param response
	 * @return
	 */
	Integer doAdminLogin(String userCode, String userPass, Integer isRemeber, HttpServletRequest request, HttpServletResponse response);

	/**
	 * @Title: doAdminLoginOut 
	 * @Description:(管理员退出登录)
	 * @param session
	 * @return
	 */
	Integer doAdminLoginOut(HttpSession session);
}
