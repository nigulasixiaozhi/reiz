/**
 * @Company:中享思途   
 * @Title:OrderController.java 
 * @Author:wxinpeng   
 * @Date:2020年1月10日 下午3:47:33     
 */
package com.situ.reiz.order.controller;

import java.io.Serializable;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.reiz.order.domain.Order;

/** 
 * @ClassName:OrderController 
 * @Description:(这里用一句话描述这个类的作用)  
 */
@Controller
@RequestMapping("/order")
public class OrderController implements Serializable {
	private static final long serialVersionUID = 1L;

	@ResponseBody
	@RequestMapping("/add")
	public Integer doAddOrder(Order order) {

		return null;
	}
}
