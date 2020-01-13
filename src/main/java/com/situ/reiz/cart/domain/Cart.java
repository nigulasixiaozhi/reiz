/**
 * @Company:中享思途   
 * @Title:Cart.java 
 * @Author:wxinpeng   
 * @Date:2020年1月6日 下午1:58:10     
 */
package com.situ.reiz.cart.domain;

import java.io.Serializable;

import com.situ.reiz.base.BaseClass;

/** 
 * @ClassName:Cart 
 * @Description:(购物车)  
 */
public class Cart extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userCode;//用户CODE
	private Long productId;//商品ID 
	private Integer orderCount;//购买数量
	private Float sumPrice;//商品总价
	
	/*额外的属性--开始*/
	private String proCode;//商品编号
	private String proName;//商品名称
	private String proPath;//商品主图
	private Float oldPrice;//商品原价
	private Float newPrice;//商品售价
	
	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

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

	public Float getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(Float oldPrice) {
		this.oldPrice = oldPrice;
	}

	public Float getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Float newPrice) {
		this.newPrice = newPrice;
	}

	/*额外的属性--结束*/
	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
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
