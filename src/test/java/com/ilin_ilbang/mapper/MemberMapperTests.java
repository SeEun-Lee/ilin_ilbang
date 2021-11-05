package com.ilin_ilbang.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ilin_ilbang.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(member -> log.info(member));
//	}
//	
//	@Test
//	public void testInsert() {
//		MemberVO member = new MemberVO();
//		member.setMid("newbie");
//		member.setMpw("1111");
//		member.setMname("홍길동");
//		member.setMtel("010-1234-5678");
//		member.setMemail("greetings07@naver.com");
//		
//		mapper.insert(member);
//		
//		log.info(member);
//	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: " + mapper.delete("newbie2"));
//	}
	
	@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		// 실행전 존재하는 아이디인지 확인할 것
		member.setMid("newbie2");
		member.setMpw("999999");
		member.setMtel("011-1212-1212");
		member.setMemail("ccc@ddd.com");
		
		int count = mapper.update(member);
		log.info("UPDATE COUNT: " + count);
	}
}
