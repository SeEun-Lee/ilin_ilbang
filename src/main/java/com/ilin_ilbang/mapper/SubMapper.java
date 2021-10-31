package com.ilin_ilbang.mapper;

import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;

public interface SubMapper {

	public void insert(room_infoVO room);
	
	public void insertOP(room_optionVO roomOP);

	public void insertP(room_priceVO roomP);
}
