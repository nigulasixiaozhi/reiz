package com.situ.reiz.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	Integer doAdminLogin(String userCode, String userPass, Integer isRemeber, HttpServletRequest request,
			HttpServletResponse response);
}
