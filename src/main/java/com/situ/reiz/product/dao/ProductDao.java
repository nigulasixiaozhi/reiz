/**
 * @Company:中享思途   
 * @Title:ProductDao.java 
 * @Author:wxinpeng   
 * @Date:2019年12月31日 下午1:41:36     
 */
package com.situ.reiz.product.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.product.domain.Product;

/** 
 * @ClassName:ProductDao 
 * @Description:(ProductDao)  
 */
@Repository
public interface ProductDao extends BaseDao<Product> {
	void updateLine(@Param("rowId") Long rowId, @Param("isLine") Integer isLine);
}
