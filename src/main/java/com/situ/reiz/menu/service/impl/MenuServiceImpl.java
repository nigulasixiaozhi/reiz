package com.situ.reiz.menu.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.menu.dao.MenuDao;
import com.situ.reiz.menu.domain.Menu;
import com.situ.reiz.menu.service.MenuService;
import com.situ.reiz.util.JSONUtils;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;

	@Override
	public Long saveMenu(Menu menu, String createBy) {
		Long parentId = menu.getParentId();
		Integer maxOrderNum = 0;
		//如果新增的是一级目录,则使用整个表最大的排序号
		if (parentId == Menu.DEFAULT_PARENT_ID) {
			maxOrderNum = menuDao.getMaxOrder();
		} else {
			// 否则根据父类主键查询最大的排序号
			maxOrderNum = menuDao.getMaxOrderByParent(parentId);
			//如果没有查询出排序号,则认为此目录下面还没有子目录,直接使用此目录的排序号
			if (maxOrderNum == null) {
				Menu parentMenu = this.menuDao.get(parentId);
				maxOrderNum = parentMenu.getOrderNum();
			}
		}
		if (maxOrderNum == null) {
			maxOrderNum = 0;
		}
		Integer orderNum = maxOrderNum + 1;
		menu.setOrderNum(orderNum);

		menu.setActiveFlag(1);
		menu.setCreateBy(createBy);
		menu.setCreateDate(new Date());
		//将大于等于这个编号的数据都自增1.
		this.menuDao.updateOrderNum(orderNum);
		
		return menuDao.save(menu);
	}

	@Override
	public List<Menu> findAllMenu() {
		return menuDao.find();
	}

	@Override
	public String checkMenuName(FieldParam fieldParam, Long parentId) {
		Menu menu = this.menuDao.getByNameAndParent(fieldParam.getFieldValue(), parentId);
		Boolean bool = menu == null ? true : false;
		return JSONUtils.buildValidationInfo(fieldParam.getFieldId(), bool);
	}

	@Override
	public List<Menu> findMenuByParent(Long parentId) {
		return this.menuDao.findByParent(parentId);
	}

	@Override
	public Menu getMenuById(Long rowId) {
		return menuDao.get(rowId);
	}

}
