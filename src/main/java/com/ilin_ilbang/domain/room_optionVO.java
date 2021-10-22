package com.ilin_ilbang.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class room_optionVO {
	
	private String rcode; // 방 등록번호
	private char ac; // 에어컨 있을시 'Y' 없을시 'N'
	private char washer; // 세탁기 있을시 'Y' 없을시 'N'
	private char fridge; // 냉장고 있을시 'Y' 없을시 'N'
	private char tv; // tv 있을시 'Y' 없을시 'N'
	private char stove; // 가스레인지 있을시 'Y' 없을시 'N'
	private char microw; // 전자레인지 있을시 'Y' 없을시 'N'
	private char bed; // 침대 있을시 'Y' 없을시 'N'
	private char desk; // 책상 있을시 'Y' 없을시 'N'
	private char closet; // 옷장 있을시 'Y' 없을시 'N'
	private char shelf; // 신발장 있을시 'Y' 없을시 'N'

}
