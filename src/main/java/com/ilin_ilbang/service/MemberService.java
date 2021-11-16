package com.ilin_ilbang.service;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO member);
	public void register(MemberVO member);
	public void modify(MemberVO member);
	public MemberVO find_pw(MemberVO member);
	public MemberVO find_id(MemberVO member);
	
}