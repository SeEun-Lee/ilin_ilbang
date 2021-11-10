package com.ilin_ilbang.service;

import java.util.List;
import com.ilin_ilbang.domain.MemberVO;

public interface MemberService {
	public void login(MemberVO member);
	public void register(MemberVO member);
	public void modify(MemberVO member);
	public void find_id(MemberVO member);
	public void find_pw(MemberVO member);
	
}
