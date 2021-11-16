package com.ilin_ilbang.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		log.info("로그인 화면 진입");
	}
	//by세진, 회원가입 화면 진입
	@GetMapping ("/member_join")
	public void register(MemberVO member) {
		log.info("회원가입 화면 진입");
	}
	//by세진, 회원정보 수정 화면 진입
	@GetMapping ("/member_modify")
	public void modify(MemberVO member) {
		log.info("회원정보 수정 화면 진입");
	}
	//by세진, 아이디 찾기 화면 진입
	@GetMapping ("/find_id")
	public void find_id(MemberVO member) {
		log.info("아이디 찾기 화면 진입");
	}
	//by세진, 비밀번호 찾기 화면 진입
	@GetMapping ("/find_pw")
	public void find_pw(MemberVO member) {
		log.info("비밀번호 찾기 화면 진입");
	}
	
	//by세진, 로그인버튼을 클릭시 데이터베이스에서 select
	@PostMapping("/login")
	public String login1(MemberVO member, HttpSession session) {
		
		log.info("로그인 서비스 처리");
		
		MemberVO vo = service.login(member);
		// MemberVO에 있는 MemberVO를 세션영역에 aaaa라는 변수에 저장
		session.setAttribute("aaaa", vo);
		
		// session영역 aaaa라는 변수에 값이 있으면 로그인 된 채로 main으로
		if(session.getAttribute("aaaa")!=null) {
			//logger.info("로그인 성공 세션에 MemberVO값 저장");
			return "redirect:/";
		}else { //그렇지 않으면 다시 로그인 할수 있게 로그인 페이지로 이동
			//logger.info("로그인 실패 세션에 null값 저장");
			return "redirect:/member/login";
		}
	}
	
	@PostMapping("/logout")
	public void logout1(HttpSession session) {
		
		log.info("로그아웃 서비스 처리");
		
		session.removeAttribute("aaaa");
		// 또는 session.invalidate();
	}
	
	//by세진, 회원가입에서 회원가입 버튼 클릭시 데이터를 데이터베이스에 insert
	@PostMapping("/member_join")
	public void register1(MemberVO member) {
		
		log.info("회원가입 처리");
		
		service.register(member);
	}

	//by세진, 회원가입에서 회원정보수정 버튼 클릭시 데이터를 데이터베이스에 update
	@PostMapping("/member_modify")
	public void modify1(MemberVO member) {
		
		log.info("회원정보 수정 처리");
		
		service.modify(member);
	}

	//by세진, 회원가입에서 아이디 찾기 select
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public void find_id(MemberVO member, Model md){
		log.info("controller 아이디 찾기 처리"+member);
		md.addAttribute("mid", service.find_id(member));
		//return "/member/find_id";
	}
	
	//by세진, 회원가입에서 비밀번호 찾기 select
	@PostMapping("/find_pw")
	public void find_pw1(MemberVO member, Model md) {
		
		log.info("비밀번호 찾기 처리");
		md.addAttribute("mpw", service.find_pw(member));
	}
}




