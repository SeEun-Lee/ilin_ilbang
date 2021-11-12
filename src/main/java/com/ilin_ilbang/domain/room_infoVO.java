package com.ilin_ilbang.domain;

// import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class room_infoVO {

	private int rcode; // 방 등록번호
	private String rtype; // 방 종류 
	private String btype; // 건물 종류 
	private String rface; // 방향
	private String addr; // 주소 
	private String addsub; // 상세주소 
	private int whlarea; // 공용 면적
	private int flr; // 층수
	private int area; // 면적 
	private int myflr; // 현재 층수
	private String mvdate; // 입주가능날을 글자로 표시 
	private String elev; // 엘리베이터 가능시 'Y' 아닐시 'N' 
	private String park; // 주차 있으면 가능시 'Y' 아닐시 'N' 
	private String pet; // 반려동물 가능시 'Y' 아닐시 'N' 
	private char mfee; // 관리비가 있을시'Y' 아닐시 'N' 
	private String rcmt; // 방 설명 제목
	private String rcont; // 방 설명 내용
	private Date regdate; // 등록 날짜(시간)
	private Date updatedate; // 수정 날짜(시간)
	private String agntid; // 중개사 아이디 
	private char mvable; // 즉시입주 가능시 'Y' 아닐시 'N'
	public List<RoomAttachVO> attachList; // 이미지 목록 리스트 저장하는곳

}