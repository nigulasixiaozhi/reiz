package com.situ.reiz.admin.service.impl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.admin.service.AdminService;
import com.situ.reiz.user.dao.UserDao;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.MD5Utils;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private UserDao userDao;

	/**
	 * 管理员登录
	 * 
	 * @param userCode
	 * @param userPass
	 * @param isRemeber
	 * @param request
	 * @param response
	 * @return 1:可以登录;2:被锁定;3:权限不够，不允许登录;4:用户名或密码错误;
	 */
	@Override
	public Integer doAdminLogin(String userCode, String userPass, Integer isRemeber, HttpServletRequest request,
			HttpServletResponse response) {
		Integer result = 0;
		User user = userDao.findByCodeAndPass(userCode, MD5Utils.encode(userPass));
		if (user != null) {
			Integer userKind = user.getUserKind();
			// 判断如果是管理员用户才允许登录
			if (User.USER_KIND_ADMIN == userKind) {
				if (User.IS_LOCK_NO == user.getIsLock()) {
					result = 1;
					HttpSession session = request.getSession();
					session.setAttribute(ConfigUtils.SESSION_ADMIN_LOGIN, user);
					if (isRemeber != null && isRemeber == 1) {
						String cookieInfo = user.getUserCode() + ":" + user.getRowId();
						Cookie cookie = new Cookie(ConfigUtils.COOKIE_ADMIN_NAME, cookieInfo);
						cookie.setMaxAge(60 * 60 * 24 * 7);
						response.addCookie(cookie);
					}
				} else {
					result = 2;
				}
			} else {
				result = 3;
			}
		} else {
			result = 4;
		}
		return result;
	}

}
