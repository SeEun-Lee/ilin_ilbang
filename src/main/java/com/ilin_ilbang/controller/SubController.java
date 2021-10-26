package com.ilin_ilbang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
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
	public String registerPost(room_infoVO room,RedirectAttributes rttr) {
		log.info("insert "+room);
		service.register(room); 
		rttr.addAttribute("rcode", room.getRcode());
		//log.info("insert ����="+board);
		
		return "redirect:/";
	}
				
}
