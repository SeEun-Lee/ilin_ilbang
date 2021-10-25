package com.ilin_ilbang.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class memberVO {

	private String mid;
	private String mpw;
	private Date mbirth;
	private String maddr;
	private String mtel;
	private String memail;
	
	//	mgender enum('Y', 'N') 아직 생성못함
	
}
