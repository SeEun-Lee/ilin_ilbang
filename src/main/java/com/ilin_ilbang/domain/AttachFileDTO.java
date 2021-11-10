package com.ilin_ilbang.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class AttachFileDTO {
	private String fileName;	// original파일이름
	private String uploadPath;	// 파일업로드경로
	private String uuid;		// uuid
	private boolean image;		// 이미지 파일 여부
}
