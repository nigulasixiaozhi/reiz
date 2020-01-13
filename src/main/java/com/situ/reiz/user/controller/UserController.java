/**
 * @Company:中享思途   
 * @Title:UserController.java 
 * @Author:wxinpeng   
 * @Date:2020年1月8日 上午9:54:17     
 */
package com.situ.reiz.user.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.user.service.UserService;

/** 
 * @ClassName:UserController 
 * @Description:(用户的Controller层)  
 */
@Controller
@RequestMapping("/user")
public class UserController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_USER_INDEX = "user/user_index";
	private static final String PAGE_USER_LIST = "user/user_list";
	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public ModelAndView goIdnex(ModelAndView modelAndView) {
		modelAndView.setViewName(PAGE_USER_INDEX);
		return modelAndView;
	}

	@RequestMapping("/list")
	public ModelAndView findAllUser(ModelAndView modelAndView) {
		modelAndView.addObject("userList", userService.findAllUser());
		modelAndView.setViewName(PAGE_USER_LIST);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/add")
	public Long addUser(User user) {
		return this.userService.addUser(user);
	}

	@ResponseBody
	@RequestMapping("/checkUserCode")
	public String checkUserCode(FieldParam fieldParam) {
		return this.userService.checkUserCode(fieldParam);
	}

	@ResponseBody
	@RequestMapping("/lock/{rowId}/{isLock}")
	public Integer doUserLock(@PathVariable Long rowId, @PathVariable Integer isLock) {
		return this.userService.doUserLock(rowId, isLock);
	}
}
