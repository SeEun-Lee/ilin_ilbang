package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.mapper.RoomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class roomServiceImpl implements roomService {
	
	private RoomMapper mapper;
	
//	@Override
//	public List<HashMap<String, String>> getListOfAll() {
//		return mapper.getListOfAll();
//	}
	
	@Override
	public List<HashMap<String, String>> getListOfAll(){
		return mapper.getListOfAll();
	}
	
	@Override
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap){
		return mapper.getListByFilter(filterMap);
	}
	
}
