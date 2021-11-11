package com.ilin_ilbang.domain;

import lombok.Data;

@Data
public class RoomAttachVO {
	private String uuid;
    private String uploadpath;
    private String filename;
    private String filetype;
    private int rcode;
}