package com.ilin_ilbang.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class AttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private int rcode;
	private boolean image;

}
