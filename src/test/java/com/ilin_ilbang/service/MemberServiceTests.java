package com.ilin_ilbang.service;

import static org.junit.Assert.assertNotNull;

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
public class MemberServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
//	
//	@Test
//	public void testRegister() {
//		MemberVO member = new MemberVO();
//		member.setMid("student2");
//		member.setMpw("3333");
//		member.setMname("김춘추");
//		member.setMtel("010-2222-3333");
//		member.setMemail("sss@ddd.com");
//		
//		service.register(member);
//		
//		log.info("생성된 아이디: " + member.getMid());
//	}
//	
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(member -> log.info(member));
//	}
//	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get("newbie3"));
//	}
	
	@Test
	public void testDelete() {
		// 회원정보의 존재여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("newbie4"));
	}
	
	@Test
	public void testUpdate() {
		
		MemberVO member = service.get("newbie5");
		
		if (member == null) {
			return;
		}
		
		member.setMname("이름 수정합니다");
		log.info("MODIFY RESULT: " + service.modify(member));
	}
}


