package com.ilin_ilbang.service;

import java.util.List;
import com.ilin_ilbang.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String mid);
	
	public boolean login(MemberVO member);
	
	public void register(MemberVO member);
	
	public boolean modify(MemberVO member);

	public String find_id(MemberVO member);

	public String find_pw(MemberVO member);
	
	public boolean remove(String mid);
	
	public List<MemberVO> getList();


	
}

