package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;

public interface roomService {
	
 	public List<HashMap<String, String>> getListOfAll();
 	
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap);
	
	public HashMap<String, String> readRoomInfo(String rcode);
	
}
