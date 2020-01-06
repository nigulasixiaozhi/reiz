package com.situ.reiz.menu.service;

import java.util.List;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.menu.domain.Menu;

public interface MenuService {

	Long saveMenu(Menu menu, String createBy);

	List<Menu> findAllMenu();

	String checkMenuName(FieldParam fieldParam, Long parentId);

	List<Menu> findMenuByParent(Long parentId);
}
