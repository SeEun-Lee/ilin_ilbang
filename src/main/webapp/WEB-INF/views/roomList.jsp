<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@include file="./includes/header.jsp" %>
		
        <div class="main_container">
            <section class="main_search">
                <div class="inner">
                    <form class="search_box">
                        <input  class="search_input" id="keyword" type="text" placeholder="검색어를 입력하세요">
                        <button class="search_btn" type="submit">검색</button>
                    </form>
                    
                    <form id="search_filter">
	                    <div class="filter_box">
	                        <ul>
	                            <li>
	                                <a href="" class="filter_title"><span>방 종류</span></a>
	                                <ul class="filter_sub">
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="o">
	                                            <span class="checkmark"></span>
	                                            <span class="name">원룸</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="t">
	                                            <span class="checkmark"></span>
	                                            <span class="name">투룸</span>
	                                        </label>
	                                    </li>
	                                </ul>
	                            </li>
	                            <li>
	                                <a href="" class="filter_title"><span>건물 종류</span></a>
	                                <ul class="filter_sub">
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="s">
	                                            <span class="checkmark"></span>
	                                            <span class="name">단독주택</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="m">
	                                            <span class="checkmark"></span>
	                                            <span class="name">다가구주택</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="of">
	                                            <span class="checkmark"></span>
	                                            <span class="name">오피스텔</span>
	                                        </label>
	                                    </li>
	                                </ul>
	                            </li>
	                            <li>
	                                <a href="" class="filter_title"><span>보증금</span></a>
	                                <ul class="filter_sub">
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="dep1">
	                                            <span class="checkmark"></span>
	                                            <span class="name">500만원 이하</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="dep2">
	                                            <span class="checkmark"></span>
	                                            <span class="name">500만원~1000만원</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="dep3">
	                                            <span class="checkmark"></span>
	                                            <span class="name">1000만원 이상</span>
	                                        </label>
	                                    </li>
	                                </ul>
	                            </li>
	                            <li>
	                                <a href="" class="filter_title"><span>월세</span></a>
	                                <ul class="filter_sub">
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="mrent1">
	                                            <span class="checkmark"></span>
	                                            <span class="name">30만원 이하</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="mrent2">
	                                            <span class="checkmark"></span>
	                                            <span class="name">30만원~60만원</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="mrent3">
	                                            <span class="checkmark"></span>
	                                            <span class="name">60만원 이상</span>
	                                        </label>
	                                </ul>
	                            </li>
	                            <li>
	                                <a href="" class="filter_title"><span>옵션</span></a>
	                                <ul class="filter_sub">
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="elev">
	                                            <span class="checkmark"></span>
	                                            <span class="name">엘리베이터 있음</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="park">
	                                            <span class="checkmark"></span>
	                                            <span class="name">주차 가능</span>
	                                        </label>
	                                    </li>
	                                    <li>
	                                        <label class="ck_container">
	                                            <input type="checkbox" name="filter" value="pet">
	                                            <span class="checkmark"></span>
	                                            <span class="name">애완동물 가능</span>
	                                        </label>
	                                    </li>
	                                </ul>
	                            </li>
	                        </ul>
	                        <button type="button" class="btn_filter" id="btn_filter">필터 적용</button>
	                        <a href="#" class="btn reset" onclick="checkAll(this)">필터 초기화</a>
	                        <a href="#" class="btn close">닫기</a>
	                    </div><!--.filter_box-->
                    </form>
                </div><!--.inner-->
                <div class="search_bg"></div>
            </section><!--.main_search-->
            
            <section class="main_list">		
				<div class="inner">	
					<div class="list">	 
						<div class="list_container" id="list_container_main">					
							<div class="list_content" id="list_content_main">	
						   		<div class="title">
						   			<h2>${title}</h2>
						   			<span class="count">(${pageMaker.total}건)</span>
						   		</div>
						   		<div class="result" style="display: none;">${result}</div>
						   		<div class="isEmpty" style="display: none;">이런! 검색 결과가 없습니다 :( <br> 다른 조건으로 검색해보시겠어요?</div>				   		
						        <ul>
						            <c:forEach items="${list}" var="room">
										<li class="room">
										 <a class="room_detail" href="javascript:void(0);"
										 onclick='window.open("/<c:out value='${room.rcode}'/>", "_blank", "width=600px", "height=500px")'>
							    				<div class="room_card">
							        				<div class="card_box">
							        					<img class="room_img" src="../resources/img/room_ex.png" alt="">
							        					<div class="find_map">
							        						<a href="">위치보기</a>
							        						<span style="display:none">${room.rcode}</span>
							        					</div>
							        					<div class="find_addr" style="display:none">${room.addr}</div>
							        					<div>
							        						<a class="btn_like">찜!</a>
							        						<span style="display:none;">${room.rcode}</span>
							        					</div>
							        					<form class="add_like" action="/like" method="post">
							        						<input type="hidden" name="rcode" value="<c:out value='${room.rcode}'/>">
							        					</form>
							        				</div>     				
							        				
							        				<div class="card_container">
							            				<div class="room_price">
							            					<c:choose>
																<c:when test="${room.rtype=='o'}">
																	<span class="room_type one">원룸</span>
																</c:when>
																<c:when test="${room.rtype=='t'}">
																	<span class="room_type two">투룸</span>
																</c:when>
															</c:choose>
															<span class="price">
																<c:out value="${room.dep}"/>
																/
																<c:out value="${room.mrent}"/>
															</span>
							                          	<span class="price_won">만원</span>  
							                      	</div><!-- .room_price -->
							                      	
													<div class="room_cmt">
														<c:out value="${room.rcmt}"/>
													</div>
													
													<div class="room_tag">
														<c:if test="${room.park eq 'Y'}">
															<span class="tag">#주차</span>
														</c:if>
														<c:if test="${room.elev eq 'Y'}">
															<span class="tag">#엘리베이터</span>
														</c:if>
														<c:if test="${room.pet eq 'Y'}">
															<span class="tag">#반려동물</span>
														</c:if>
														</div><!-- .room_tag -->
													<div class="room_addr">
														<span class="addr">
															<c:set var="address" value="${room.addr}"/>
																${fn:split(address," ")[0]}
																${fn:split(address," ")[1]}
																${fn:split(address," ")[2]}
														</span>
							                       		<span class="regdate">
							                           		<fmt:formatDate pattern="MM.dd" value="${room.regdate}"/>
							        					</span>
												    </div>
												</div><!--.card_container-->
											</div><!-- .room_card -->
										</a>
									</li>
								</c:forEach>
						  		</ul>
						  		<div class="list_pager">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="paginate_btn previous_10p">
												<a href="${pageMaker.startPage - 1}">이전 10페이지</a>
											</li>
										</c:if>
										<c:if test="${pageMaker.cri.pageNum > 1}">
											<li class="paginate_btn previous_1p">
												<a href="${pageMaker.cri.pageNum - 1}">이전 1페이지</a>
											</li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<li class="paginate_btn pageNum ${pageMaker.cri.pageNum == num ? 'active':''}">
												<a href="${num}">${num}</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.cri.pageNum < pageMaker.endPage}">
											<li class="paginate_btn next_1p">
												<a href="${pageMaker.cri.pageNum + 1}">다음 1페이지</a>
											</li>
										</c:if>
										<c:if test="${pageMaker.next}">
											<li class="paginate_btn next_10p">
												<a href="${pageMaker.endPage + 1}">다음 10페이지</a>
											</li>
										</c:if>
									</ul>
								</div><!-- .list_pager -->
								<script src="${pageContext.request.contextPath}/resources/js/roomList.js"></script>
							</div><!-- #list_content -->
							
							<div class="map_wrap" style="top:190px; right:270px;">
					    		<div id="map" style="width:400px;height:400px;position:relative;overflow:hidden;"></div>
							</div><!-- "map_wrap" -->
						</div><!-- .list_container -->
					</div><!-- .list -->	
			</div><!-- .inner -->
		</section><!-- .main_list -->         
  </div><!--.main-container-->
  
  <!-- 찜 버튼 클릭시 모달창 입니다 -->
 <div class="modal_like">
		<div class="modal_text">
			<span class='modal_rcode'></span> 번 방이 관심 목록에 추가되었습니다.<br> 찜 목록으로 이동하시겠어요?
		</div>
		<div class="modal_btn_box">
			<a href="/like" class="modal_btn_1">네</a>
			<a class="modal_btn_2">아니요</a>
		</div>
		<div class="modal_close">창 닫기</div>
 </div> <!-- .modal_like -->
 
 <!-- 이미 관심목록에 추가된 방일 시 모달창입니다 -->
 <div class="modal_fail">
 		<div class="modal_text">
 			이미 관심목록에 추가된 방입니다!<br>관심 목록에서 삭제하시겠습니까?
 		</div>
 		<div class="modal_btn_box">
 			<span class='modal_rcode' style="display:none;"></span>
 			<a class="modal_btn_1 btn_dislike">삭제</a>
 			<a class="modal_btn_2">취소</a>
 		</div>
 		<div class="modal_close">창 닫기</div>
 </div><!-- .modal_fail -->
 
 <!-- 관심목록 삭제 모달창입니다 -->
  <div class="modal_dislike">
 		<div class="modal_text">
 			<span class='modal_rcode'></span> 번 방이 관심 목록에서 삭제되었습니다.
 		</div>
 		<div class="modal_btn_box">
 			<a class="modal_btn_2">확인</a>
 		</div>
 		<div class="modal_close">창 닫기</div>
 </div><!-- .modal_dislike -->
  
<%@include file="./includes/footer.jsp" %>

	<!-- js -->		
	<script src="${pageContext.request.contextPath}/resources/js/filter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/roomLike.js"></script>
	<script>
	
		// 지도로 보낼 json 데이터
		var list = new Array();
		
		<c:forEach items="${list}" var="room">
			var json = new Object();
			json.rcode="${room.rcode}";
			json.addr="${room.addr}";
			json.dep="${room.dep}";
			json.mrent="${room.mrent}";
			list.push(json);
		</c:forEach>
	
	</script>


