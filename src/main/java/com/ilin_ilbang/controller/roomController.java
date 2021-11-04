package com.ilin_ilbang.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ilin_ilbang.domain.AttachFileDTO;
import com.ilin_ilbang.domain.Criteria;
import com.ilin_ilbang.domain.PageDTO;
import com.ilin_ilbang.domain.RoomAttachVO;
import com.ilin_ilbang.domain.likeVO;
import com.ilin_ilbang.domain.room_infoVO;
import com.ilin_ilbang.domain.room_optionVO;
import com.ilin_ilbang.domain.room_priceVO;
import com.ilin_ilbang.service.roomService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
// @RequestMapping(value="/")
@AllArgsConstructor
public class roomController{
	
	private roomService service;
	
	// 전체 리스트
	@GetMapping(value="/")
	public String list(@RequestParam(value="filters[]", required=false) List<String> filters,
					   Criteria cri, Model model) {
		
		if (filters == null) { // 적용된 필터가 없으면 전체 목록을 출력
			log.info("전체 목록 출력");
			int total = service.getTotalCount(cri);
			PageDTO pager = new PageDTO(cri, total);
			model.addAttribute("title", "현재 등록된 매물이에요");
			model.addAttribute("list", service.getListOfAll(cri));
			model.addAttribute("pageMaker", pager);
			
		} else { // 적용된 필터가 있으면 getListByFilter로 결과 목록 출력
			log.info("filters : " + filters);
			
			// filterArr : List<> filters를 String[]으로
			String[] filterArr = filters.toArray(new String[filters.size()]);
			log.info("filterArr.length : " + filterArr.length);

			// inOperator : where ~ in 구문 쓰기 위해 filterArr 와 비교 
			String[] inOperator = {"o", "t", "s", "m", "o", "dep1", "dep2", "dep3", 
			                       "mrent1", "mrent2", "mrent3", "elev", "park", "pet"};
			log.info("inOperator.length : " + inOperator.length);
		
			// 임시로 사용할 전체 리스트 list 
			List<String> list = new ArrayList<>();
			
			// DB에 보낼 HashMap
			HashMap<String, Object> filterMap = new HashMap<>();
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
			filterMap.put("pageNum", cri.getPageNum());
			filterMap.put("amount", cri.getAmount());

			int total = service.getFilterListCount(filterMap);
			PageDTO pager = new PageDTO(cri, total);
			
			model.addAttribute("title", "검색 결과"); 
			model.addAttribute("pageMaker", pager);
			
			if (service.getFilterListCount(filterMap) == 0) { // 결과 count가 0일 경우 
				model.addAttribute("result", "검색결과 없음");
			} else { // 결과 count가 0이 아닐 경우 	
				model.addAttribute("list", service.getListByFilter(filterMap));	
			}
		}
		log.info(model);
		return "roomList";		
	}
	
		
	// 방 클릭시 상세페이지 팝업
	@RequestMapping(value = "/{rcode}", method = RequestMethod.GET)
	public ModelAndView readRoomInfo(@PathVariable("rcode") String rcode) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/roomInfo");
		mav.addObject("Info", service.readRoomInfo(rcode));
		log.info("상세페이지 - 정보 출력 확인 : " + service.readRoomInfo(rcode));
		
		return mav;
	}
	
	// 방 등록 페이지 
	@GetMapping("/register")
	public String register() {
		log.info("room_register");
		return "roomRegister";
	}
	
	// 방 등록 (게시글 등록)
	@PostMapping("room_register")
	public String registerPost(room_infoVO room,room_optionVO roomOP,room_priceVO roomP) {
		log.info("insert : "+room+"OP : "+roomOP+"P : "+roomP);
		service.register(room); 
		service.registerOP(roomOP); 
		service.registerP(roomP);
		
		if(room.getAttachList()!=null) {
			room.getAttachList().forEach(attach->log.info(attach));
		}
				
		return "redirect:/";
	}
	
//	// 방 등록 (첨부파일 등록) 
//	@GetMapping(value="getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ResponseEntity<List<RoomAttachVO>> getAttachList(int rcode){
//		log.info("getAttachList="+rcode);
//		return new ResponseEntity<>(service.getAttachList(rcode),HttpStatus.OK);
//		
//	}
	
	// 찜 클릭시 관심 목록에 추가
	@ResponseBody
	@PostMapping("/like")
	public String addLike(likeVO like, @RequestParam(value="rcode") int rcode){
		
		like.setMid("user000");	// 임의 아이디 설정
		like.setRcode(rcode);
		String result;
		
		// 이미 추가한 방인지 확인
		boolean isLiked = service.addLikeCount(like) > 0;
		if (!isLiked) { // 이미 추가된 방이 아니라면
			service.addLike(like); 
			result = "1"; // 1을 반환 
		} else { // 이미 추가된 방이라면
			result = "0"; // 0을 반환
		}
		
		log.info(result);
		return result; // 0 OR 1을 return함
		
	}
	
	// 관심목록 취소
	@ResponseBody
	@PostMapping("/dislike")
	public String dislike(likeVO like, @RequestParam(value="rcode") int rcode) {
		
		log.info("dislike");
		like.setMid("user000");
		like.setRcode(rcode);
		String result = "";
		service.dislike(like);
		
		return result;
	}
	
	
	// 관심목록 출력
	@RequestMapping(value = "/roomLike", method = RequestMethod.GET)
	public String roomLike(Model model, Criteria cri) {
		
		String mid = "user000"; // 임의 아이디 설정

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("pageNum", cri.getPageNum());
		map.put("amount", cri.getAmount());
		
		int total = service.userLikeCount(mid); // 좋아요 개수 카운트
		PageDTO pager = new PageDTO(cri, total); // 페이저 생성
		
		// 유저가 좋아요한 방이 최소 1개인지 확인
		boolean isEmpty = total < 1;
		if (!isEmpty) { // 최소 1개라면
			model.addAttribute("mid", mid);
			model.addAttribute("pageMaker", pager);
			model.addAttribute("list", service.userLikeList(map));
		} else { // 좋아요한 방이 없다면
			model.addAttribute("title", "아직 찜하신 방이 없네요.");
			model.addAttribute("total", total);
		}

		log.info(model);
		return "roomLike";		
		
	}
}

