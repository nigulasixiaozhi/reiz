/**
 * @Company:中享思途   
 * @Title:Wish.java 
 * @Author:wxinpeng   
 * @Date:2020年1月8日 下午3:22:07     
 */
package com.situ.reiz.wish.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/** 
 * @ClassName:Wish 
 * @Description:(收藏)  
 */
@Alias("Wish")
public class Wish extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userCode;//用户CODE
	private String proCode;//商品编号
	/*额外的属性-开始*/
	private Long proId;//商品主键
	private String proName;//商品名称
	private String proPath;//商品主图
	private Float oldPrice;//商品原价
	private Float newPrice;//商品售价
	private Integer isNew;//是否上新#1:是;0:否;
	private Integer proCount;//库存数量
	private Integer isLine;//是否在架#1:是;0:否;
	
	public Long getProId() {
		return proId;
	}

	public void setProId(Long proId) {
		this.proId = proId;
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

	public Integer getIsNew() {
		return isNew;
	}

	public void setIsNew(Integer isNew) {
		this.isNew = isNew;
	}

	public Integer getProCount() {
		return proCount;
	}

	public void setProCount(Integer proCount) {
		this.proCount = proCount;
	}

	public Integer getIsLine() {
		return isLine;
	}

	public void setIsLine(Integer isLine) {
		this.isLine = isLine;
	}

	/*额外的属性-结束*/
	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}
}
