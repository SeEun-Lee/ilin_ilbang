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
	
	// by세은, 메인페이지 (방 목록 출력)
	// List<String> filters는 적용된 필터에 대한 파라미터 정보를 담습니다
	@GetMapping(value="/")
	public String list(@RequestParam(value="filters[]", required=false) List<String> filters,
					   Criteria cri, Model model) {
		
		// 적용된 필터가 없으면 전체목록을 출력합니다.
		if (filters == null) {
			int total = service.getTotalCount(cri);
			PageDTO pager = new PageDTO(cri, total);
			model.addAttribute("title", "현재 등록된 매물이에요");
			model.addAttribute("list", service.getListOfAll(cri));
			model.addAttribute("pageMaker", pager);
		
		// 적용된 필터가 있을시 (filters가 null이 아닐 시) 검색결과를 출력합니다.
		} else { 
			// Mybatis에서 where ~ in 구문을 사용하기 위해 
			// filters List에 한번에 있는 문자열 타입의 데이터를 DB 테이블 칼럼 별로 나누어
			// 각각 다른 ArrayList에 담아주는 작업을 합니다. 

			// List<> filters를 String[]으로 변환합니다.
			String[] filterArr = filters.toArray(new String[filters.size()]);
			// 모든 필터가 적용됬을 시의 String[] 배열을 생성합니다. 
			String[] inOperator = {"o", "t", "s", "m", "o", "dep1", "dep2", "dep3", 
			                       "mrent1", "mrent2", "mrent3", "elev", "park", "pet"};
			// 아래 for ~ if문의 결과를 임시로 담을 list를 생성합니다.  
			List<String> list = new ArrayList<>();
			// DB에 보낼 HashMap 입니다.
			HashMap<String, Object> filterMap = new HashMap<>();
			// filterMap에 담을 list입니다.
			List<String> rtype = new ArrayList<>();
			List<String> btype = new ArrayList<>();
			List<String> dep = new ArrayList<>();
			List<String> mrent = new ArrayList<>();
			List<String> option = new ArrayList<>();
			
			// filterArr와 inOperator를 index순으로 비교하여
			// 사용자가 선택하지 않은 필터 조건에는 공백값대신 'na'라는 문자열을 넣는 작업을 합니다. 
			// 즉, filterArr[i]가 inOperator[j]와 같은지 체크하면서 (for)
			// 같다면 해당 filterArr[i]의 값을 list의 j번째에 넣고, 
			// 같지 않다면 'na'를 list의 j번째에 넣는 작업입니다. (if ~ else) 
			for (int i = 0; i < filterArr.length; i++ ) { // 사용자가 선택한 필터개수만큼 반복합니다.
				for (int j = 0; j < inOperator.length; j++) { 
					// 사용자의 값과 inOperator[j]가 같지않고,
					if ( !(filterArr[i].equals(inOperator[j])) ){ 
						if ( list.size() == j ) { // list의 길이가 j와 같다면 
							list.add(j, "na"); // list의 j번째에 "na"를 추가합니다.
						} else { // list의 길이가 j보다 작다면, (그 안에 이미 값이 있다는 의미)
							if(list.get(j).equals("na")) list.set(j, "na"); // set으로 수정해줍니다. 
						}; // end if ~ else 
					} else { // 2. 사용자의 값과 inOperator[j]가 같다면 
						list.add(j, filterArr[i]) ; //  list의 j번째에 filterArr[i]의 값을 추가하고
						break; // for문을 끝냅니다. 
					}; // end if ~ else 
				}; // end inOperator for 
			}; // end filterArr for

			// 마지막 filterArr[i] 이후 남는 빈 자리에 "na" 넣어 길이를 고정합니다.
			for ( int i = list.size(); i < inOperator.length; i++ ) {
				list.add(i, "na");
			}
			
			// 위에서 만든 임시 list는 사용자 값과 'na'로 이루어져있습니다.
			// 인덱스를 기준으로 분류하되 'na'값은 제외해줍니다. 
			for ( int i = 0; i < list.size(); i++ ) {
				if (i < 2) { // 0 ~ 1번째 값 → rtype 기준 검색
					if ( list.get(i) != "na") {
						rtype.add(list.get(i));
					}
				} else if ( i < 5 ) { // 2 ~ 4번째 값 → btype 기준 검색
					if ( list.get(i) != "na") {
						btype.add(list.get(i));
					}
				} else if ( i < 8 ) { // 5 ~ 7 번째 값 → dep 기준 검색
					if ( list.get(i) != "na") {
						dep.add(list.get(i));
					}
				} else if ( i < 11 ) { // 8 ~ 10 번째 값 → mrent 기준 검색
					if ( list.get(i) != "na") {
						mrent.add(list.get(i));
					}
				} else { // 11 ~ 13 번째 값 → 'Y'인지 'N'인지 체크하는 것이 전부이므로 한 번에 담아줍니다.  
					if ( list.get(i) != "na") {
						option.add(list.get(i));
					}
				}
			}

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
		return "roomList";		
	}
	
		
	// by 세은, 방 클릭시 상세페이지 팝업
	@RequestMapping(value = "/{rcode}", method = RequestMethod.GET)
	public ModelAndView readRoomInfo(@PathVariable("rcode") String rcode) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/roomInfo");
		mav.addObject("Info", service.readRoomInfo(rcode));		
		return mav;
	}
	
	// 방 등록 페이지 
	@GetMapping("/roomRegister")
	public String register() {
		log.info("room_register");
		return "roomRegister";
	}
	
	// 방 등록 (게시글 등록)
	@PostMapping("/room_register")
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
	
	// by 세은, 찜 클릭시 찜 목록에 추가
	@ResponseBody
	@PostMapping("/like")
	public String addLike(likeVO like, @RequestParam(value="rcode") int rcode){
		// 로그인 기능이 구현되지 않은 관계로 임의 아이디 설정하여 작업합니다. 
		like.setMid("user000");	
		like.setRcode(rcode);
		String result = "";
		// 이미 추가한 방인지 확인
		boolean isLiked = service.addLikeCount(like) > 0;
		if (!isLiked) { // 이미 추가된 방이 아니라면
			service.addLike(like); 
			result = "1"; // 1을 반환 
		} else { // 이미 추가된 방이라면
			result = "0"; // 0을 반환
		}
		return result; // 0 OR 1을 return 합니다.
	}
	
	// by 세은, 찜 취소
	// 1) 찜 버튼을 재 클릭시 2) 관심목록 페이지에서 선택-삭제 시 찜을 취소합니다. 
	@ResponseBody
	@PostMapping("/dislike")
	public String dislike(String mid, @RequestParam(value="rcodeArr[]") List<String> rcodeArr) {
		mid = "user000"; // 임의 아이디 설정
		HashMap<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("rcode", rcodeArr);
		String result = "";
		if (rcodeArr.size() != 0) { // 삭제할 것이 있고,
			service.dislike(map); // 성공적으로 삭제를 하면
			result = "1"; // 1을 반환한다
		} else { // 삭제할 글이 없으면,
			result = "0"; // 0을 반환한다
		}
		return result; // 0 OR 1을 return 합니다.
	}

	// by 세은, 관심목록 출력
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
		return "roomLike";			
	}
	
	// by 세은, 거래 관리 페이지
	@RequestMapping("/myDeal")
	public String myDeal(String agntid, Criteria cri, Model model) {
		agntid = "agnt000"; // 임의 아이디 설정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("agntid", agntid);
		map.put("cri", cri);
		
		HashMap<String, Integer> postCnt = service.agntPostCnt(agntid);
		// String으로 변환 후에 int로 변환합니다.
		int total = Integer.parseInt(String.valueOf(postCnt.get("total")));
		PageDTO pager = new PageDTO(cri, total);
		model.addAttribute("agntid", agntid);
		model.addAttribute("sum", service.agntPostCnt(agntid));
		model.addAttribute("list", service.agntPostList(map));
		model.addAttribute("pageMaker", pager);
		log.info(model);
		return "myDeal";
	}
}

