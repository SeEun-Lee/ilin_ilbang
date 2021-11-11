package com.ilin_ilbang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ilin_ilbang.domain.MemberVO;
import com.ilin_ilbang.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public void register(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO get(String mid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(MemberVO member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String mid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}
}
