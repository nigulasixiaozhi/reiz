package com.situ.reiz.area.service;

import java.util.List;

import com.situ.reiz.area.domain.Area;

public interface AreaService {
	List<Area> findAreaByParentCode(Long parentCode);
}
