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
	
	//by세진, 로그인 화면 진입
	@GetMapping ("/login")
	public void login(MemberVO member) {
		log.info("login!!" + member);
	}
	//by세진, 회원가입 화면 진입
	@GetMapping ("/member_join")
	public void register(MemberVO member) {
		log.info("join!!" + member);
	}
	//by세진, 회원가입 수정 화면 진입
	@GetMapping ("/member_modify")
	public void modify(MemberVO member) {
		log.info("modify!!" + member);
	}
	//by세진, 아이디 찾기 화면 진입
	@GetMapping ("/find_id")
	public void find_id(MemberVO member) {
		log.info("find_id!!" + member);
	}
	//by세진, 비밀번호 찾기 화면 진입
	@GetMapping ("/find_pw")
	public void find_pw(MemberVO member) {
		log.info("find_pw!!" + member);
	}
	
	//by세진, 로그인버튼을 클릭시 데이터베이스에서 select
	@PostMapping("/login")
	public void login1(MemberVO member) {
		
		log.info("register: " + member);
		
		service.login(member);
	}
	//by세진, 회원가입에서 회원가입 버튼 클릭시 데이터를 데이터베이스에 insert
	@PostMapping("/member_join")
	public void register1(MemberVO member) {
		
		log.info("register: " + member);
		
		service.register(member);
	}
	
	//by세진, 회원가입에서 회원정보수정 버튼 클릭시 데이터를 데이터베이스에 update
	@PostMapping("/member_modify")
	public void modify1(MemberVO member) {
		
		log.info("modify: " + member);
		
		service.modify(member);
	}
	//by세진, 회원가입에서 아이디 찾기 select
	@PostMapping("/find_id")
	public void find_id1(MemberVO member) {
		
		log.info("find_id: " + member);
		
		service.find_id(member);
	}
	//by세진, 회원가입에서 비밀번호 찾기 select
	@PostMapping("/find_pw")
	public void find_pw1(MemberVO member) {
		
		log.info("find_pw: " + member);
		
		service.find_pw(member);
	}
		
}