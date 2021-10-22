package com.ilin_ilbang.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.ilin_ilbang.domain.room_infoVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//WAS를 실행하지 않고 스프링의 테스트 기능을 활용

@RunWith(SpringJUnit4ClassRunner.class)

//Test for Controller
@WebAppConfiguration
// WebApplicationContext라는 존재를 이용하기 위함

@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class RoomControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;
	// 가짜 mvc
	// 가짜로 URL과 파라미터 등을 브라우저에서 사용하는 것처럼 만들어 컨트롤러 실행
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();	
	}
	
	@Test
	public void testList() throws Exception{
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	
}
