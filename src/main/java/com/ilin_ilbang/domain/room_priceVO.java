package com.ilin_ilbang.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class room_priceVO {

	private int rcode; // 방 등록번호
	private int dep; // 보증금 
	private String dtype; // 거래 종류 => 월세: 'm' 전세: 'y' 
	private int mrent; // 월세(원)
	private int yrent; // 전세(원)
	private int mcfee; // 관리비(원)
}
