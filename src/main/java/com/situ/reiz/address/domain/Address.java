/**
 * @Company:中享思途   
 * @Title:Address.java 
 * @Author:wxinpeng   
 * @Date:2019年12月30日 上午9:56:06     
 */
package com.situ.reiz.address.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/** 
 * @ClassName:Address 
 * @Description:(收货地址名称)  
 */
@Alias("Address")
public class Address extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userCode;//关联用户CODE
	private Long area1;//省CODE
	private Long area2;//市CODE
	private Long area3;//区CODE
	private String linkName;//收货人姓名
	private String linkPhone;//收货人电话
	private String linkArea;//区域信息
	private String linkAddr;//详细地址。
	private String postCode;//邮编
	private Integer isDefault;//是否为默认收货地址#1:是;0:否;

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public Long getArea1() {
		return area1;
	}

	public void setArea1(Long area1) {
		this.area1 = area1;
	}

	public Long getArea2() {
		return area2;
	}

	public void setArea2(Long area2) {
		this.area2 = area2;
	}

	public Long getArea3() {
		return area3;
	}

	public void setArea3(Long area3) {
		this.area3 = area3;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkPhone() {
		return linkPhone;
	}

	public void setLinkPhone(String linkPhone) {
		this.linkPhone = linkPhone;
	}

	public String getLinkArea() {
		return linkArea;
	}

	public void setLinkArea(String linkArea) {
		this.linkArea = linkArea;
	}

	public String getLinkAddr() {
		return linkAddr;
	}

	public void setLinkAddr(String linkAddr) {
		this.linkAddr = linkAddr;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public Integer getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}
}
