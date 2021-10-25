package com.ilin_ilbang.service;

import org.springframework.stereotype.Service;

import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.mapper.SubMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class SubServiceImpl implements SubService {
	private SubMapper mapper;

	@Override
	public room_infoVO get(int rcode) {
		log.info("get......."+rcode);
		return mapper.room_info(rcode);
	}
	

}
