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

	@GetMapping("/member/login")
	public void get() {
		log.info("login!!");
	}
	@GetMapping("/member/login_action")
	public void get0() {
		log.info("login!!");
	}

	@GetMapping("/member/member_join")
	public void get1() {
		log.info("join!!");
	}

	@GetMapping("/member/find_id")
	public void get2() {
		log.info("find_ID!!");
	}

	@GetMapping("/member/find_pw")
	public void get3() {
		log.info("find_password!!");
	}

	@GetMapping("/member/member_modify")
	public void get4() {
		log.info("modify!!");
	}

	@GetMapping("/member/quit")
	public void get5() {
		log.info("quit!!");
	}
	
	@PostMapping("/member/member_join")
	public String register(MemberVO member, RedirectAttributes rttr) {
		
		log.info("join: " + member);
		
		service.register(member);
		rttr.addFlashAttribute("result", member.getMid());
		
		return "redirect:/member/login";
	}

	
	@PostMapping("/member/member_modify")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		log.info("modify: " + member);
		
		if (service.modify(member)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/";
	}

	@PostMapping("/member/find_id")
	public String find_id(MemberVO member, RedirectAttributes rttr) {
		
		log.info("find id: " + member);
		
		if (service.find_id(member) != null) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/member/login";
	}

	@PostMapping("/member/find_pw")
	public String find_pw(MemberVO member, RedirectAttributes rttr) {
		
		log.info("find password: " + member);
		
		if (service.find_pw(member) != null) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/member/login";
	}
	
	@PostMapping("/member/quit")
	public String remove(@RequestParam("mid") String mid,
			RedirectAttributes rttr) {
		
		log.info("remove...." + mid);
		if (service.remove(mid)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/";
	}
}
