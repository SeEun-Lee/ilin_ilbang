package com.ilin_ilbang.mapper;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ilin_ilbang.domain.Criteria;

public interface RoomMapper {

	// 전체 리스트
	public List<HashMap<String, String>> getListOfAll();
	
	// 필터에 의한 리스트
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap);
	
	// 상세페이지 정보 출력 
	public HashMap<String, String> readRoomInfo(String rcode);
	
	
}


