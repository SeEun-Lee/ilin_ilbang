package com.ilin_ilbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberMapper {

	//@Select("select * from member_info")
	public MemberVO login(MemberVO member);

	public void register(MemberVO member);

	public void modify(MemberVO member);

	public MemberVO find_id(MemberVO member);

	public MemberVO find_pw(MemberVO member);

}
