package com.ilin_ilbang.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class room_infoVO {

	private int rcode; // 占쏙옙 占쏙옙球占싫�
	private char btype; // 占실뱄옙 占쏙옙占쏙옙 
	private char rtype; // 占쏙옙 占쏙옙占쏙옙 
	private String addr; // 占쌍쇽옙 
	private int area; // 占쏙옙占쏙옙 
	private int whlarea; // 占쏙옙占쏙옙 占쏙옙占쏙옙
	private int flr; // 占쏙옙占쏙옙
	private String rface; // 占쏙옙占쏙옙
	private char mvable; // 占쏙옙占쏙옙占쏙옙占� 占쏙옙占심울옙占쏙옙 
	private Date mvdate; // 占쏙옙占쌍곤옙占쏙옙占쏙옙 
	private char elev; // 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占심쏙옙 'Y' 占싣닐쏙옙 'N' 
	private char park; // 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占심쏙옙 'Y' 占싣닐쏙옙 'N' 
	private char pet; // 占쌥뤄옙占쏙옙占쏙옙 占쏙옙占심쏙옙 'Y' 占싣닐쏙옙 'N' 
	private String rcmt; // 占쏙옙 占쏙옙占쏙옙
	private Date regdate; // 占쏙옙占� 占쏙옙짜(占시곤옙)
	private Date updatedate; // 占쏙옙占쏙옙 占쏙옙짜(占시곤옙)
	private String agentid; // 占쌩곤옙占쏙옙 占쏙옙占싱듸옙  
	
}
