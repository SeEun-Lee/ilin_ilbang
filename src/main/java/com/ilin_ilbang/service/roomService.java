package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.domain.likeVO;

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
	
	// 좋아요 추가
	public void addLike(likeVO like);
	
	// 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like);
	
	// 유저의 좋아요 리스트 출력
	public List<HashMap<String, String>> userLikeList(String mid);
	
	// 유저의 좋아요 카운트 
	public int userLikeCount(String mid);
	
}
