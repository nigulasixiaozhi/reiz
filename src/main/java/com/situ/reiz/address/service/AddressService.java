/**
 * @Company:中享思途   
 * @Title:AddressService.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午10:28:40     
 */
package com.situ.reiz.address.service;

import java.util.List;

import com.situ.reiz.address.domain.Address;

/** 
 * @ClassName:AddressService 
 * @Description:(AddressService)  
 */
public interface AddressService {
	Long saveAddress(Address address, String createBy);

	Integer doPutAddress(Address address, String createBy);

	List<Address> findAddressByUser(String userCode);

	Integer doSetDefaultAddress(Long rowId, String userCode);

	Address getAddressById(Long rowId);
}
