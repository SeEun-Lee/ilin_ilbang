package com.ilin_ilbang.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.service.roomService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
// @RequestMapping(value="/room")
@AllArgsConstructor
public class roomController{
	
	private roomService service;
	
	// 사이트 진입 시 전체 리스트 Controller 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", service.getListOfAll());
		return "index";
	}
	
	// 필터적용 버튼 클릭 시 결과 리스트 Controller
	@RequestMapping(value = "/listByFilter", method = RequestMethod.GET)
	public String ListByFilter(@RequestParam(value="filters[]", required=false) List<String> filters, Model model) {
		
//		log.info("filters : " + Arrays.toString(filterArr) + " length : " + filterArr.length);
		
		log.info("filters : " + filters);
		
		// filterArr : List<> filters를 String[]으로
		String[] filterArr = filters.toArray(new String[filters.size()]);
		log.info("filterArr.length : " + filterArr.length);

		// inOperator : where ~ in 구문 쓰기 위해 filterArr 와 비교 
		String[] inOperator = {"o", "t", "s", "m", "o", "dep1", "dep2", "dep3", 
		                       "mrent1", "mrent2", "mrent3", "elev", "park", "pet"};
		log.info("inOperator.length : " + inOperator.length);
	
		// 임시로 담을 전체 list 
		List<String> list = new ArrayList<>();
		
		// Mapper에 보낼 HashMap
		HashMap<String, List<String>> filterMap = new HashMap<>();
		List<String> rtype = new ArrayList<>();
		List<String> btype = new ArrayList<>();
		List<String> dep = new ArrayList<>();
		List<String> mrent = new ArrayList<>();
		List<String> option = new ArrayList<>();
		
		// 매 filterArr[i] 마다 inOperator[0]~[13]와 같은지 돌면서 체크
		for (int i = 0; i < filterArr.length; i++ ) {  
			for (int j = 0; j < inOperator.length; j++) { 
				
				if ( !(filterArr[i].equals(inOperator[j])) ){ // 둘이 같지 않고,
					if ( list.size() == j ) { // list의 길이가 j와 같다면 
						list.add(j, "na"); // list의 j번째 index에 "na"를 추가
					}; 
				} else { // 얘네 둘이 같으면
					list.add(j, filterArr[i]) ; //  list의 j번째 index에 filterArr[i]의 값을 추가
					break; // 하고 나감   
				};
			};
		};
		
		log.info("list..1 : " + list.toString());
		
		// 마지막 filterArr[i] 이후 남는 빈 자리에 "na" 넣어주기
		for ( int i = list.size(); i < inOperator.length; i++ ) {
			list.add(i, "na");
		}
		log.info("list..2 : " + list.toString());
		
		
		// map 에 들어갈 list에 add
		for ( int i = 0; i < list.size(); i++ ) {
			if (i < 2) {
				if ( list.get(i) != "na") {
					rtype.add(list.get(i));
				}
			} else if ( i < 5 ) {
				if ( list.get(i) != "na") {
					btype.add(list.get(i));
				}
			} else if ( i < 8 ) {
				if ( list.get(i) != "na") {
					dep.add(list.get(i));
				}
			} else if ( i < 11 ) {
				if ( list.get(i) != "na") {
					mrent.add(list.get(i));
				}
			} else {
				if ( list.get(i) != "na") {
					option.add(list.get(i));
				}
			}
		}
		
		log.info("rtype : " + rtype);
		log.info("btype : " + btype);
		log.info("dep : " + dep);
		log.info("mrent : " + mrent);
		log.info("option : " + option);
		
		filterMap.put("rtype", rtype);
		filterMap.put("btype", btype);
		filterMap.put("dep", dep);
		filterMap.put("mrent", mrent);
		filterMap.put("option", option);		
		
		model.addAttribute("list", service.getListByFilter(filterMap));
		
		return "roomList";
	}
	
	
	// 방 클릭시 상세페이지 이동
	@GetMapping("/{rcode}")
	public String readRoomInfo(@PathVariable("rcode") String rcode, Model model) {
		
		model.addAttribute("Info", service.readRoomInfo(rcode));
		
		log.info(service.readRoomInfo(rcode));
		return "roomInfo";
	}
	
}

