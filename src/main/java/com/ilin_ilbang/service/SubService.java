package com.ilin_ilbang.service;

import com.ilin_ilbang.domain.AttachFileDTO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;

public interface SubService {
		
	public void register(room_infoVO room);
	
	public void registerOP(room_optionVO roomOP);

	public void registerP(room_priceVO roomP);

	public void registerRA(AttachFileDTO roomRA);
	
}
