package com.ilin_ilbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberMapper {

	//@Select("select * from member_info")
	

	public int login(MemberVO member);
	
	public String register(MemberVO member);
	
	public String find_id(MemberVO member);

	public String find_pw(MemberVO member);
	
	public int update(MemberVO member);
	
	public int delete(String mid);
	

}
