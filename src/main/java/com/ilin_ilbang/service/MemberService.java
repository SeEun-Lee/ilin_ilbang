package com.ilin_ilbang.service;

import java.util.List;
import com.ilin_ilbang.domain.MemberVO;

public interface MemberService {
	
	public void get(MemberVO member);
	public void get0(MemberVO member);
	public void get1(MemberVO member);
	public void get2(MemberVO member);
	public void get3(MemberVO member);
	public void get4(MemberVO member);
	public void get5(MemberVO member);
	
	
	public int login(MemberVO member);
	
	public void register(MemberVO member);
	
	public boolean modify(MemberVO member);

	public String find_id(MemberVO member);

	public String find_pw(MemberVO member);
	
	public boolean remove(String mid);


	
}

