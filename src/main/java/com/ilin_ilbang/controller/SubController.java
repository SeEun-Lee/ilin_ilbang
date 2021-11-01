package com.ilin_ilbang.controller;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ilin_ilbang.domain.AttachFileDTO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;
import com.ilin_ilbang.service.SubService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/sub")
public class SubController {
	
	private SubService service;
	
	@GetMapping("room_register")
	public void register() {
		log.info("room_register");
	}
	
	@PostMapping("room_register")
	public String registerPost(room_infoVO room,room_optionVO roomOP,room_priceVO roomP,AttachFileDTO roomRA) {
		log.info("insert : "+room+"OP : "+roomOP+"P : "+roomP);
		service.register(room); 
		service.registerOP(roomOP); 
		service.registerP(roomP);
		service.registerRA(roomRA);
		
		//log.info("insert ����="+board);
		
		return "redirect:/";
	}

				
}
