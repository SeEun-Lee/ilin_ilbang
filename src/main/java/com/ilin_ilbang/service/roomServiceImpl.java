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
	
	@Override //by세은, 전체 목록
	public List<HashMap<String, String>> getListOfAll(Criteria cri){
		return mapper.getListOfAll(cri);
	}
	
	@Override //by세은, 필터에 의한 목록 
	public List<HashMap<String, String>> getListByFilter(HashMap<String, Object> filterMap){
		return mapper.getListByFilter(filterMap);
	}
	
	@Override //by세은, 필터에 의한 목록 count
	public int getFilterListCount(HashMap<String, Object> filterMap) {
		return mapper.getFilterListCount(filterMap);
	}
	
	@Override //by세은, 상세 페이지 정보 
	public HashMap<String, String> readRoomInfo(String rcode){
		return mapper.readRoomInfo(rcode);
	};
	
	@Override //by세은, 전체 목록 count
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Transactional
	@Override //by영규, 방등록 페이지, 데이터 등록하기
	public void register(room_infoVO room) {
		log.info("get......."+room);
		mapper.insertSelectKey(room);
		if(room.getAttachList()==null || room.getAttachList().size()<=0) {
			return;
		}
		room.getAttachList().forEach(attach->{
			// RoomAttachVO필통에 넣어라 (BoardVO필통에 있는 rcode를 가져와서)
			attach.setRcode(room.getRcode());
			// room_attach테이블에 파일정보를 insert해라.
			attachMapper.insert(attach);
		});
	}

	@Override //by영규, 방 등록하기 (room_optionVO)
	public void registerOP(room_optionVO roomOP) {
		log.info("get......."+roomOP);
		mapper.insertOP(roomOP);
	}
	
	@Override//by영규 방 등록하기 (room_priceVO)
	public void registerP(room_priceVO roomP) {
		log.info("get......."+roomP);
		mapper.insertP(roomP);
	}

	@Override//by영규
	public List<RoomAttachVO> getAttachList(int rcode) {
		log.info("getAttachList........"+rcode);
		return attachMapper.findByRcode(rcode);
	}

	@Override//by영규
	public room_infoVO get(long rcode) {
		return mapper.read(rcode);	
	}
	
	@Override //by세은, 방 수정페이지 열릴 때 기존 정보 출력하기
	public HashMap<String, String> roomModifyLoad(int rcode){
		return mapper.roomModifyLoad(rcode);
	}
	
	@Override //by세은, 좋아요 추가
	public void addLike(likeVO like) {
		mapper.addLike(like);
	}
	
	@Override //by세은, 이미 좋아요 한 방인지 확인
	public int addLikeCount(likeVO like) {
		return mapper.addLikeCount(like);
	}
	
	@Override //by세은, 좋아요 취소 
	public void dislike(HashMap<String, Object> map) {
		mapper.dislike(map);
	}
	
	@Override //by세은, 유저의 좋아요 리스트 출력
	public List<HashMap<String, String>> userLikeList(HashMap<String, Object> map){
		return mapper.userLikeList(map);
	}
	
	@Override //by세은, 유저의 좋아요 카운트
	public int userLikeCount(String mid) {
		return mapper.userLikeCount(mid);
	}
	
	@Override //by세은, 공인중개사가 등록한 방 목록 출력
	public List<HashMap<String, String>> agntPostList(HashMap<String,Object> map){
		return mapper.agntPostList(map);
	}
	
	@Override //by세은, 공인중개사가 등록한 방 카운트
	public HashMap<String, Integer> agntPostCnt(String agntid){
		return mapper.agntPostCnt(agntid);
	}
	
	@Override //by세은, 방 수정 동작 (room_info)
	public int modifyRoomI(room_infoVO roomI) {
		return mapper.modifyRoomI(roomI);
	};
	
	@Override//by세은, 방 수정 동작 (room_price)
	public int modifyRoomP(room_priceVO roomP) {
		return mapper.modifyRoomP(roomP);
	};
	
	@Override //by세은, 방 수정 동작 (room_option)
	public int modifyRoomOP(room_optionVO roomOP) {
		return mapper.modifyRoomOP(roomOP);
	};
	
	@Override //by세은, 방 삭제
	public int deleteRoom(int rcode) {
		return mapper.deleteRoom(rcode);
	}
}
