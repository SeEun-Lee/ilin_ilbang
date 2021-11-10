package com.ilin_ilbang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ilin_ilbang.domain.MemberVO;
import com.ilin_ilbang.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService service;
	
	@GetMapping ("/login")
	public void login(MemberVO member) {
		log.info("login!!" + member);
	}
	@GetMapping ("/member_join")
	public void register(MemberVO member) {
		log.info("join!!" + member);
	}
	@GetMapping ("/member_modify")
	public void modify(MemberVO member) {
		log.info("modify!!" + member);
	}
	@GetMapping ("/find_id")
	public void find_id(MemberVO member) {
		log.info("find_id!!" + member);
	}
	@GetMapping ("/find_pw")
	public void find_pw(MemberVO member) {
		log.info("find_pw!!" + member);
	}
	
	@PostMapping("/login")
	public void login1(MemberVO member) {
		
		log.info("register: " + member);
		
		service.login(member);
	}
	
	@PostMapping("/member_join")
	public void register1(MemberVO member) {
		
		log.info("register: " + member);
		
		service.register(member);
	}
	
	@PostMapping("/member_modify")
	public void modify1(MemberVO member) {
		
		log.info("modify: " + member);
		
		service.modify(member);
	}
	
	@PostMapping("/find_id")
	public void find_id1(MemberVO member) {
		
		log.info("find_id: " + member);
		
		service.find_id(member);
	}
	
	@PostMapping("/find_pw")
	public void find_pw1(MemberVO member) {
		
		log.info("find_pw: " + member);
		
		service.find_pw(member);
	}
		
}
