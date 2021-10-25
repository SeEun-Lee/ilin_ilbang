package com.ilin_ilbang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


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
	public void register(int rcode) {
		log.info("roomregister"+rcode);
		service.get(rcode);
	}


}
