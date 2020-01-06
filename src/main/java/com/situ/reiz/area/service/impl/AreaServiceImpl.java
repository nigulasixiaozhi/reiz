/**
 * @Company:中享思途   
 * @Title:AreaServiceImpl.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午9:54:05     
 */
package com.situ.reiz.area.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.area.dao.AreaDao;
import com.situ.reiz.area.domain.Area;
import com.situ.reiz.area.service.AreaService;

/** 
 * @ClassName:AreaServiceImpl 
 * @Description:(AreaServiceImpl)  
 */
@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	private AreaDao areaDao;

	/** 
	 * @Title: findAreaByParentCode 
	 * @Description:(根据Parent查询数据)
	 * @param parentCode
	 * @return  
	 */
	@Override
	public List<Area> findAreaByParentCode(Long parentCode) {
		return areaDao.findByParent(parentCode);
	}

}
