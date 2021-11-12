package com.ilin_ilbang.mapper;


import java.util.HashMap;
import java.util.List;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.domain.likeVO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;

public interface RoomMapper {

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
	
	//by용규
	public void insert(room_infoVO room);
	
	//by용규
	public void insertSelectKey(room_infoVO room);
	
	//by용규
	public void insertOP(room_optionVO roomOP);
	
	//by용규
	public void insertP(room_priceVO roomP);

	//by용규
	public room_infoVO read(long rcode);
	
	//by세은, 방 수정페이지 열릴 때 기존 정보 출력하기
	public HashMap<String, String> roomModifyLoad(int rcode);
	
	//by세은, 좋아요 추가
	public void addLike(likeVO like);
	
	//by세은, 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like);
	
	//by세은, 좋아요 취소 
	public void dislike(HashMap<String, Object> map);
	
	//by세은, 유저의 좋아요 목록 출력
	public List<HashMap<String, String>> userLikeList(HashMap<String, Object> map);
	
	//by세은, 유저의 좋아요 카운트
	public int userLikeCount(String mid);
	
	//by세은, 공인중개사가 등록한 방 목록 출력
	public List<HashMap<String, String>> agntPostList(HashMap<String,Object> map);
	
	//by세은, 공인중개사가 등록한 방 카운트
	public HashMap<String, Integer> agntPostCnt(String agntid);
	
	//by세은, 방 수정 동작 (room_info)
	public void modifyRoomI(room_infoVO roomI);
	
	//by세은, 방 수정 동작 (room_price)
	public void modifyRoomP(room_priceVO roomP);
	
	//by세은, 방 수정 동작 (room_option)
	public void modifyRoomOP(room_optionVO roomOP);
}


