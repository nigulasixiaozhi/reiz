/**
 * @Company:中享思途   
 * @Title:AreaController.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 下午2:14:38     
 */
package com.situ.reiz.area.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.reiz.area.domain.Area;
import com.situ.reiz.area.service.AreaService;

/** 
 * @ClassName:AreaController 
 * @Description:(AreaController)  
 */
@Controller
public class AreaController implements Serializable {
	private static final long serialVersionUID = 1L;
	@Autowired
	private AreaService areaService;

	@ResponseBody
	@RequestMapping("/area/list/{parentCode}")
	public List<Area> findAreaByParent(@PathVariable Long parentCode) {
		return this.areaService.findAreaByParentCode(parentCode);
	}
}
