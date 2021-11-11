package com.ilin_ilbang.service;

import java.util.List;

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

	@Override
	public void login(MemberVO member) {
		log.info("login......."+member);
		mapper.login(member);
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
	public void find_id(MemberVO member) {
		log.info("find_id......."+member);
		mapper.find_id(member);
	}
	@Override
	public void find_pw(MemberVO member) {
		log.info("find_pw......."+member);
		mapper.find_pw(member);
	}
}
