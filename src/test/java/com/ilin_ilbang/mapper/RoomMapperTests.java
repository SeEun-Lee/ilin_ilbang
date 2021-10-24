package com.ilin_ilbang.mapper;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ilin_ilbang.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class RoomMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private RoomMapper mapper;
	
	
//	@Test
//	public void testGetListOfAll() {
//		mapper.getListOfAll().forEach(board->log.info(board));
//	}
	
//	@Test
//	public void testGetListOfAllWithPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		List<HashMap<String, String>> list = mapper.getListOfAllWithPaging(cri); 
//		list.forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testReadRoomInfo() {
//		
//		HashMap<String, String> RoomInfo = mapper.readRoomInfo("12312");
//		
//		log.info(RoomInfo);
//	}
	
	@Test
	public void testPaging() {
		List<HashMap<String, String>> list = mapper.getListOfAll();
		log.info(list);
	}
}

