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
	
	//by세은, 전체 목록
 	public List<HashMap<String, String>> getListOfAll(Criteria cri);
 	
 	//by세은, 전체 목록 count
 	public int getTotalCount(Criteria cri);
 	
 	//by세은, 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, Object> filterMap);
	
	//by세은, 필터에 의한 목록 count 
	public int getFilterListCount(HashMap<String, Object> filterMap);
	
	//by세은, 상세페이지 정보
	public HashMap<String, String> readRoomInfo(String rcode);
	
	//by영규,
	public void register(room_infoVO room);
	
	//by영규, 방정보 페이지 옵션으로 insert
	public void registerOP(room_optionVO roomOP);
	
	//by영규, 방정보 페이지, 프라이스로 insert
	public void registerP(room_priceVO roomP);
	
	//by영규, 방정보 페이지, 이미지 리스트 
	public List<RoomAttachVO> getAttachList(int rcode);

	//by세은, 방 수정페이지 열릴 때 기존 정보 출력하기
	public HashMap<String, String> roomModifyLoad(int rcode);
	
	//by세은, 좋아요 추가
	public void addLike(likeVO like);
	
	//by세은, 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like);
	
	//by세은, 좋아요 취소 
	public void dislike(HashMap<String, Object> map);
	
	//by세은, 유저의 좋아요 리스트 출력
	public List<HashMap<String, String>> userLikeList(HashMap<String, Object> map);
	
	//by세은, 유저의 좋아요 카운트 
	public int userLikeCount(String mid);
	
	//by세은, 공인중개사가 등록한 방 목록 출력
	public List<HashMap<String, String>> agntPostList(HashMap<String,Object> map);
	
	//by세은, 공인중개사가 등록한 방 카운트
	public HashMap<String, Integer> agntPostCnt(String agntid);
}
