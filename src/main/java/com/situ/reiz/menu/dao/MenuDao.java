package com.situ.reiz.menu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.reiz.base.BaseDao;
import com.situ.reiz.menu.domain.Menu;

@Repository
public interface MenuDao extends BaseDao<Menu> {

	Menu getByNameAndParent(@Param("menuName") String menuName, @Param("parentId") Long parentId);
	
	Integer getMaxOrder();
	
	Integer getMaxOrderByParent(Long parentId);
	
	void updateOrderNum(Integer orderNum);
	
	List<Menu>findByParent(Long parentId);
}
