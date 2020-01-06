/**
 * @Company:中享思途   
 * @Title:AddressDao.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午10:17:09     
 */
package com.situ.reiz.address.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.reiz.address.domain.Address;
import com.situ.reiz.base.BaseDao;

/** 
 * @ClassName:AddressDao 
 * @Description:(AddressDao)  
 */
@Repository
public interface AddressDao extends BaseDao<Address> {

	List<Address> findByUser(String userCode);
	
	void updateNoDefault(String userCode);
	
	void updateDefault(Long rowId);
}
