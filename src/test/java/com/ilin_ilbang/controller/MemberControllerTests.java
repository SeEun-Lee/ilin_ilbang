package com.ilin_ilbang.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {
	
	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/member/login"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
	}
	
	@Test
	public void testRegister()throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/member/member_join")
				.param("mid", "테스트 새아이디")
				.param("mpw", "테스트 새비밀번호")
				.param("mname", "테스트 새이름")
				.param("mtel", "010-3333-4444")
				.param("memail", "new11@email.com")
		).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}



