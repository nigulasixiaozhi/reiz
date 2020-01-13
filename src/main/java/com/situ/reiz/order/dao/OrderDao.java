/**
 * @Company:中享思途   
 * @Title:OrderDao.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午2:02:14     
 */
package com.situ.reiz.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.order.domain.Order;

/** 
 * @ClassName:OrderDao 
 * @Description:(OrderDao)  
 */
@Repository
public interface OrderDao extends BaseDao<Order> {
	List<Order> findByUser(String userCode);
}
