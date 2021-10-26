package com.ilin_ilbang.service;

import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;

public interface SubService {
		
	public void register(room_infoVO room);

	public room_infoVO get(long rcode);
	
}
