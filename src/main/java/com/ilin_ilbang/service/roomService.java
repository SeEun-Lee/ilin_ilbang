package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.domain.RoomAttachVO;
import com.ilin_ilbang.domain.likeVO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;

public interface roomService {
	
	// 전체 목록
 	public List<HashMap<String, String>> getListOfAll(Criteria cri);
 	
 	// 전체 목록 count
 	public int getTotalCount(Criteria cri);
 	
 	// 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, Object> filterMap);
	
	// 필터에 의한 목록 count 
	public int getFilterListCount(HashMap<String, Object> filterMap);
	
	// 상세페이지 정보
	public HashMap<String, String> readRoomInfo(String rcode);
	
	// 방 등록 (room_info)
	public void register(room_infoVO room);
	
	// 방 등록 (room_option)
	public void registerOP(room_optionVO roomOP);

	// 방 등록 (room_price)
	public void registerP(room_priceVO roomP);
	
//	// 방 등록 (room_attach)
//	public List<RoomAttachVO> getAttachList(int bno);
	
	// 좋아요 추가
	public void addLike(likeVO like);
	
	// 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like);
	
	// 좋아요 취소 
	public void dislike(likeVO like);
	
	// 유저의 좋아요 리스트 출력
	public List<HashMap<String, String>> userLikeList(HashMap<String, Object> map);
	
	// 유저의 좋아요 카운트 
	public int userLikeCount(String mid);
	
}
