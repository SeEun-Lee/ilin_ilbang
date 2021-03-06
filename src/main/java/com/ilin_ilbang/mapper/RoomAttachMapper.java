package com.ilin_ilbang.mapper;

import java.util.List;

import com.ilin_ilbang.domain.RoomAttachVO;

public interface RoomAttachMapper {
	// 파일업로드한 파일정보들을 room_attach테이블에 insert함.
	public void insert(RoomAttachVO vo);
	// 파일업로드한 파일정보들을 room_attach테이블에 delete함.
	public void delete(String uuid);
	// 파일업로드한것을 사용자가 볼 수 있도록 화면에 조회할 수 있도록 함.
	public List<RoomAttachVO> findByRcode(int rcode);
}