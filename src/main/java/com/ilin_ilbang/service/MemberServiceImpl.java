package com.ilin_ilbang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ilin_ilbang.domain.MemberVO;
import com.ilin_ilbang.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	//private MemberMapper manager;

	@Override
	public MemberVO login(MemberVO member) {
		log.info("login......."+member);
		return mapper.login(member);
	}
	@Override
	public void register(MemberVO member) {
		log.info("register......."+member);
		mapper.register(member);
	}
	@Override
	public void modify(MemberVO member) {
		log.info("modify......."+member);
		mapper.modify(member);
	}
	@Override
	public MemberVO find_id(MemberVO member){
		System.out.println("service 아이디 찾기 처리");
		return member = mapper.find_id(member);
	}
	
	@Override
	public MemberVO find_pw(MemberVO member) {
		System.out.println("service find_pw......."+member);
		return mapper.find_pw(member);
	}

}
