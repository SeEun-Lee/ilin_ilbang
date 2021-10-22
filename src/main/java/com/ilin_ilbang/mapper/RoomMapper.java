package com.ilin_ilbang.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ilin_ilbang.domain.Criteria;

public interface RoomMapper {

	// @Select("select * from room_info")
	public List<HashMap<String, String>> getListOfAll();
	
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap);
	
}


