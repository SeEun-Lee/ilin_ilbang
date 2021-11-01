package com.ilin_ilbang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.ilin_ilbang.domain.MemberVO;

public interface MemberMapper {

	//@Select("select * from member_info")
	public List<MemberVO> getList();
	public void insert(MemberVO member_info);
	public void insertSelectKey(MemberVO member_info);
}
