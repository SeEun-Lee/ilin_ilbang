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
	
	@Override // 전체 목록
	public List<HashMap<String, String>> getListOfAll(Criteria cri){
		return mapper.getListOfAll(cri);
	}
	
	@Override // 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, List<String>> filterMap){
		return mapper.getListByFilter(filterMap);
	}
	
	@Override // 상세 페이지 정보 
	public HashMap<String, String> readRoomInfo(String rcode){
		return mapper.readRoomInfo(rcode);
	};
	
	@Override // 전체 목록 count
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override // 필터에 의한 목록 count
	public int getFilterListCount(HashMap<String, List<String>> filterMap) {
		return mapper.getFilterListCount(filterMap);
	}
	
}
