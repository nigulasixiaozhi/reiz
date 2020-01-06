package com.situ.reiz.menu.domain;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.situ.reiz.base.BaseClass;

/**
 * 目录
 * 
 * @author wxinpeng
 */
@Alias("Menu")
public class Menu extends BaseClass implements Serializable {
	private static final long serialVersionUID = 1L;
	public static final long DEFAULT_PARENT_ID = -1;
	private Long parentId;// 父类主键
	private Integer menuKind;// 目录级别
	private String menuName;// 目录名称
	private String menuInfo;// 目录简介
	private Integer orderNum;// 排序编号
	
	/*额外的属性 -开始*/
	private List<Menu>childList;
	
	public List<Menu> getChildList() {
		return childList;
	}

	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}

	/*额外的属性 -结束*/
	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getMenuKind() {
		return menuKind;
	}

	public void setMenuKind(Integer menuKind) {
		this.menuKind = menuKind;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuInfo() {
		return menuInfo;
	}

	public void setMenuInfo(String menuInfo) {
		this.menuInfo = menuInfo;
	}

	public Integer getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	
}
