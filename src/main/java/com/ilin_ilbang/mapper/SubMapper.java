package com.ilin_ilbang.mapper;

import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;

public interface SubMapper {
	
	public room_infoVO room_info(int rcode);

	public void insert(room_infoVO room);
	public void insert(room_optionVO roomOP);
}
