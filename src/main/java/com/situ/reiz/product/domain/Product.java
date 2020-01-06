package com.situ.reiz.product.domain;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/**
 * @ClassName:Product 
 * @Description:(商品名称)
 */
@Alias("Product")
public class Product extends BaseClass implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long menuId;//目录ID
	private String proCode;//商品编号
	private String proName;//商品名称
	private String proPath;//商品主图
	private Float oldPrice;//商品原价
	private Float newPrice;//商品售价
	private Integer isNew;//是否上新#1:是;0:否;
	private Integer proCount;//库存数量
	private Integer isLine;//是否在架#1:是;0:否;
	private String proInfo;//商品简介
	/*额外的属性-开始*/
	private String menuName;//目录名称

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	/*额外的属性-结束*/

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

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

	public String getProInfo() {
		return proInfo;
	}

	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
	}

}
