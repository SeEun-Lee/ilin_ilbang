package com.ilin_ilbang.service;

import org.springframework.stereotype.Service;

import com.ilin_ilbang.domain.AttachFileDTO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;
import com.ilin_ilbang.mapper.SubMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class SubServiceImpl implements SubService {
	private SubMapper mapper;
	
	@Override
	public void register(room_infoVO room) {
		log.info("get......."+room);
		mapper.insert(room);
	}

	@Override
	public void registerOP(room_optionVO roomOP) {
		log.info("get......."+roomOP);
		mapper.insertOP(roomOP);
	}
	
	@Override
	public void registerP(room_priceVO roomP) {
		log.info("get......."+roomP);
		mapper.insertP(roomP);
	}

	@Override
	public void registerRA(AttachFileDTO roomRA) {
		log.info("get......."+roomRA);
		mapper.insertRA(roomRA);
	}


	
	


}
