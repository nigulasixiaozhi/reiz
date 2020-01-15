/**
 * @Company:中享思途   
 * @Title:WishDao.java 
 * @Author:wxinpeng   
 * @Date:2020年1月8日 下午3:25:40     
 */
package com.situ.reiz.wish.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.wish.domain.Wish;

/** 
 * @ClassName:WishDao 
 * @Description:(WishDao)  
 */
@Repository
public interface WishDao extends BaseDao<Wish> {
	Wish findByUserAndPro(@Param("userCode") String userCode, @Param("proCode") String proCode);

	List<Wish> findAllWish(String userCode);

	Integer getCount(String userCode);
	
	List<String>findProList(String userCode);
}
