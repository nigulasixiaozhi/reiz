/**
 * @Company:中享思途   
 * @Title:CartDao.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午2:01:19     
 */
package com.situ.reiz.cart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.cart.domain.Cart;

/** 
 * @ClassName:CartDao 
 * @Description:(CartDao )  
 */
@Repository
public interface CartDao extends BaseDao<Cart> {
	List<Cart> findByUser(String userCode);

	Cart getByCodeAndPro(@Param("userCode") String userCode, @Param("proId") Long proId);
	
	void updateOrderCount(Long rowId);
	
	List<Cart>findAllData(String userCode);
	
	void deleteByUser(String userCode);
}
