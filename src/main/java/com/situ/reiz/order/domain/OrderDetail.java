/**
 * @Company:中享思途   
 * @Title:OrderDetail.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午1:46:47     
 */
package com.situ.reiz.order.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/** 
 * @ClassName:OrderDetail 
 * @Description:(订单明细)  
 */
@Alias("OrderDetail")
public class OrderDetail extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long orderId;//订单主键
	private Long productId;//商品主键
	private Integer orderCount;// 购买数量
	private Float sumPrice;//商品总价
	/*额外属性开始*/
	private String proName;//
	private String proPath;//
	private Float newPrice;//
	
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProPath() {
		return proPath;
	}

	public void setProPath(String proPath) {
		this.proPath = proPath;
	}

	public Float getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Float newPrice) {
		this.newPrice = newPrice;
	}

	/*额外属性结束*/
	public OrderDetail() {
	}

	public OrderDetail(Long orderId, Long productId, Integer orderCount, Float sumPrice) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.orderCount = orderCount;
		this.sumPrice = sumPrice;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}

	public Float getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(Float sumPrice) {
		this.sumPrice = sumPrice;
	}
}
