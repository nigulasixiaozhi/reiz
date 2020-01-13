/**
 * @Company:中享思途   
 * @Title:AddressServiceImpl.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午10:29:56     
 */
package com.situ.reiz.address.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.address.dao.AddressDao;
import com.situ.reiz.address.domain.Address;
import com.situ.reiz.address.service.AddressService;
import com.situ.reiz.util.MyBatisUtils;

/** 
 * @ClassName:AddressServiceImpl 
 * @Description:(这里用一句话描述这个类的作用)  
 */
@Service
public class AddressServiceImpl implements AddressService {
	@Autowired
	private AddressDao addressDao;

	/** 
	 * @Title: saveAddress 
	 * @Description:(新增数据)
	 * @param address
	 * @return  
	 */
	@Override
	public Long saveAddress(Address address, String createBy) {
		address.setIsDefault(0);
		address.setActiveFlag(1);
		address.setCreateBy(createBy);
		address.setCreateDate(new Date());
		this.addressDao.save(address);
		return address.getRowId();
	}

	/**
	 * @Title: doPutAddress 
	 * @Description:(修改数据)
	 * @param address
	 * @param createBy
	 * @return
	 */
	@Override
	public Integer doPutAddress(Address address, String createBy) {
		Address editAddress = this.addressDao.get(address.getRowId());
		editAddress = MyBatisUtils.buildEditData(editAddress, address);
		this.addressDao.update(editAddress);
		return 1;
	}

	/** 
	 * @Title: findAddressByUser 
	 * @Description:(根据用户查询收货地址集合)
	 * @param userCode
	 * @return  
	 */
	@Override
	public List<Address> findAddressByUser(String userCode) {
		return addressDao.findByUser(userCode);
	}

	@Override
	public Integer doSetDefaultAddress(Long rowId, String userCode) {
		this.addressDao.updateNoDefault(userCode);
		this.addressDao.updateDefault(rowId);
		return 1;
	}

	/** 
	 * @Title: getAddressById 
	 * @Description:(这里用一句话描述这个方法的作用)
	 * @param rowId
	 * @return  
	 */
	@Override
	public Address getAddressById(Long rowId) {
		return this.addressDao.get(rowId);
	}

}
