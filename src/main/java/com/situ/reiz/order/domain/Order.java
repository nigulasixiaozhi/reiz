/**
 * @Company:中享思途   
 * @Title:Order.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午1:43:02     
 */
package com.situ.reiz.order.domain;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/** 
 * @ClassName:Order 
 * @Description:(订单处理)  
 */
@Alias("Order")
public class Order extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private String orderNum;//订单编号
	private String userCode;//用户编号
	private String linkName;//收货人名称
	private String linkPhone;//收货人电话
	private String orderDesc;//订单备注
	private Float sumPrice;//订单总价
	private Long addressId;//收货地址Id
	private Integer orderStatus;//订单状态#1:待付款;2:待发货;3:;4:;
	/*额外的参数开始*/
	private List<OrderDetail> orderDetailList;

	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	/*额外的参数结束*/
	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
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

	public String getOrderDesc() {
		return orderDesc;
	}

	public void setOrderDesc(String orderDesc) {
		this.orderDesc = orderDesc;
	}

	public Float getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(Float sumPrice) {
		this.sumPrice = sumPrice;
	}

	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
}
