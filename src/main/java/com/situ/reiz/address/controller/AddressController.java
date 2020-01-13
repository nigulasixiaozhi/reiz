/**
 * @Company:中享思途   
 * @Title:AddressController.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午10:31:15     
 */
package com.situ.reiz.address.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.situ.reiz.address.domain.Address;
import com.situ.reiz.address.service.AddressService;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.ContextUtils;

/** 
 * @ClassName:AddressController 
 * @Description:(AddressController)  
 */
@Controller
@RequestMapping("/address")
public class AddressController implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_SHOP_ADDRESS_LIST = "shop/address/address_list";
	@Autowired
	private AddressService addressService;

	/**
	 * @Title: findAllAddress 
	 * @Description:(查询列表数据)
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/list")
	public ModelAndView findAllAddress(ModelAndView modelAndView) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		modelAndView.addObject("addressList", this.addressService.findAddressByUser(userCode));
		modelAndView.setViewName(PAGE_SHOP_ADDRESS_LIST);
		return modelAndView;
	}

	/**
	 * @Title: doAddAddress 
	 * @Description:(新增数据)
	 * @param address
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add")
	public Long doAddAddress(Address address) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		address.setUserCode(userCode);
		return this.addressService.saveAddress(address, userCode);
	}

	/**
	 * @Title: setDefaultAddress 
	 * @Description:(设置为默认)
	 * @param rowId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/default/{rowId}")
	public Integer setDefaultAddress(@PathVariable Long rowId) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		return this.addressService.doSetDefaultAddress(rowId, userCode);
	}

	/**
	 * @Title: getAddressById 
	 * @Description:(根据ID查询实例)
	 * @param rowId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/get/{rowId}")
	public Address getAddressById(@PathVariable Long rowId) {
		return this.addressService.getAddressById(rowId);
	}

	/**
	 * @Title: doAddAddress 
	 * @Description:(更新数据)
	 * @param address
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update")
	public Integer doPutAddress(Address address) {
		String userCode = ContextUtils.getUserCode(ConfigUtils.SESSION_USER_LOGIN);
		address.setUserCode(userCode);
		return this.addressService.doPutAddress(address, userCode);
	}
}
