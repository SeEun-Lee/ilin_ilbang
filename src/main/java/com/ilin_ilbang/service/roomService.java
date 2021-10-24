package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;

public interface roomService {
	
	// 전체 목록
 	public List<HashMap<String, String>> getListOfAll(Criteria cri);
 	
 	// 전체 목록 count
 	public int getTotalCount(Criteria cri);
 	
 	// 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap);
	
	// 상세페이지 정보
	public HashMap<String, String> readRoomInfo(String rcode);
	
	// 필터에 의한 목록 count 
	public int getFilterListCount(HashMap<String, List<String>> filterMap);
	
}
