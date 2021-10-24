package com.ilin_ilbang.mapper;


import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;

public interface RoomMapper {

	// 전체 목록
	public List<HashMap<String, String>> getListOfAll(Criteria cri);
	
	// 전체 목록 count
	public int getTotalCount(Criteria cri);
	
	// 필터에 의한 목록
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap);
	
	// 필터에 의한 목록 count
	public int getFilterListCount(HashMap<String, List<String>> filterMap);
	
	// 상세페이지 정보
	public HashMap<String, String> readRoomInfo(String rcode);
	
	
}


