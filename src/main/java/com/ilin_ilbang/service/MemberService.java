package com.ilin_ilbang.service;

import java.util.List;
import com.ilin_ilbang.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member);
	public MemberVO get(String mid);
	public boolean modify(MemberVO member);
	public boolean remove(String mid);
	public List<MemberVO> getList();
	
}
