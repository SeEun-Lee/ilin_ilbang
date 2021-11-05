package com.ilin_ilbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberMapper {

	//@Select("select * from member_info")
	
	public List<MemberVO> getList();

	public boolean login(MemberVO member);
	
	public String find_id(MemberVO member);

	public String find_pw(MemberVO member);
	
	public void insertSelectKey(MemberVO member);
	
	public MemberVO read(String mid);

	public void register(MemberVO member);
	
	public int delete(String mid);
	
	public int update(MemberVO member);
}
