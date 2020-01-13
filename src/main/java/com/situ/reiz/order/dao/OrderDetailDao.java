/**
 * @Company:中享思途   
 * @Title:OrderDetailDao.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午2:02:38     
 */
package com.situ.reiz.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.order.domain.OrderDetail;

/** 
 * @ClassName:OrderDetailDao 
 * @Description:(OrderDetailDao)  
 */
@Repository
public interface OrderDetailDao extends BaseDao<OrderDetail> {
	/**
	 * @Title: saveBatch 
	 * @Description:(批量保存)
	 * @param orderDetailList
	 */
	void saveBatch(@Param("orderDetailList") List<OrderDetail> orderDetailList);

	/**
	 * @Title: findByOrder 
	 * @Description:(根据orderId查询列表)
	 * @param orderId
	 * @return
	 */
	List<OrderDetail> findByOrder(Long orderId);
}
