package com.ilin_ilbang.domain;

import lombok.Data;

@Data
public class RoomAttachVO {
	private String uuid;		// uuid
    private String uploadpath;	// 파일업로드경로
    private String filename;	// original파일이름
    private String filetype;	// 파일 타입

    private int rcode;			// 등록 번호
}