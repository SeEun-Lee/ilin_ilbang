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
	public boolean login(MemberVO member) {
		
		log.info("login......" + member);
		mapper.insertSelectKey(member);
		return mapper.login(member);
	}


	@Override
	public void register(MemberVO member) {
		
		log.info("register......");
		mapper.register(member);
	}

	@Override
	public String find_id(MemberVO member) {
		
		log.info("find_id......");
		return mapper.find_id(member);
	}

	@Override
	public String find_pw(MemberVO member) {
		
		log.info("find_pw......");
		return mapper.find_pw(member);
	}

	@Override
	public boolean modify(MemberVO member) {
		
		log.info("modify......");
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(String mid) {
		
		log.info("remove......");
		return mapper.delete(mid) == 1;
	}


	@Override
	public List<MemberVO> getList() {
		
		log.info("getList......");
		return mapper.getList();
	}


	@Override
	public MemberVO get(String mid) {

		return mapper.read(mid);
	}


}
