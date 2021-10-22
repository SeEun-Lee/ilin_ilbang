package com.ilin_ilbang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping("roomInfo")
	public void read(String rcode, Model model) {
		log.info("roomInfo"+rcode);
		model.addAttribute("read", service.get(rcode));
	}
	@GetMapping("roomInfo")
	public void register() {
		log.info("roomInfo_register");
	}
}
