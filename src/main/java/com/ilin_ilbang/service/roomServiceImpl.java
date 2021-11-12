package com.ilin_ilbang.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.domain.RoomAttachVO;
import com.ilin_ilbang.domain.likeVO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;
import com.ilin_ilbang.mapper.RoomAttachMapper;
import com.ilin_ilbang.mapper.RoomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class roomServiceImpl implements roomService {
	
	private RoomMapper mapper;
	private RoomAttachMapper attachMapper;
	
	@Override // 전체 목록
	public List<HashMap<String, String>> getListOfAll(Criteria cri){
		return mapper.getListOfAll(cri);
	}
	
	@Override // 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, Object> filterMap){
		return mapper.getListByFilter(filterMap);
	}
	
	@Override // 필터에 의한 목록 count
	public int getFilterListCount(HashMap<String, Object> filterMap) {
		return mapper.getFilterListCount(filterMap);
	}
	
	@Override // 상세 페이지 정보 
	public HashMap<String, String> readRoomInfo(String rcode){
		return mapper.readRoomInfo(rcode);
	};
	
	@Override // 전체 목록 count
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public void registerOP(room_optionVO roomOP) {
		log.info("get......."+roomOP);
		mapper.insertOP(roomOP);
	}
	
	@Override
	public void registerP(room_priceVO roomP) {
		log.info("get......."+roomP);
		mapper.insertP(roomP);
	}

	@Override
	public List<RoomAttachVO> getAttachList(int rcode) {
		log.info("getAttachList........"+rcode);
		return attachMapper.findByRcode(rcode);
	}

	@Override
	public room_infoVO get(long rcode) {
		return mapper.read(rcode);	
	}
	
	@Override // by 세은, 방 수정페이지 열릴 때 기존 정보 출력하기
	public HashMap<String, String> roomModifyLoad(int rcode){
		return mapper.roomModifyLoad(rcode);
	}
	
	@Override // 좋아요 추가;
	public void addLike(likeVO like) {
		mapper.addLike(like);
	}
	
	@Override // 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like) {
		return mapper.addLikeCount(like);
	}
	
	@Override // 좋아요 취소 
	public void dislike(HashMap<String, Object> map) {
		mapper.dislike(map);
	}
	
	@Override // 유저의 좋아요 리스트 출력
	public List<HashMap<String, String>> userLikeList(HashMap<String, Object> map){
		return mapper.userLikeList(map);
	}
	
	@Override // 유저의 좋아요 카운트
	public int userLikeCount(String mid) {
		return mapper.userLikeCount(mid);
	}
	
	@Override // 공인중개사가 등록한 방 목록 출력
	public List<HashMap<String, String>> agntPostList(HashMap<String,Object> map){
		return mapper.agntPostList(map);
	}
	
	@Override // 공인중개사가 등록한 방 카운트
	public HashMap<String, Integer> agntPostCnt(String agntid){
		return mapper.agntPostCnt(agntid);
	}
}
