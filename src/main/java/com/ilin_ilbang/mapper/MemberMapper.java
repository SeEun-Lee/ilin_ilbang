package com.ilin_ilbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberMapper {

	//@Select("select * from member_info")
	public void login(MemberVO member);

	public void register(MemberVO member);

	public void modify(MemberVO member);

	public void find_id(MemberVO member);

	public void find_pw(MemberVO member);

}