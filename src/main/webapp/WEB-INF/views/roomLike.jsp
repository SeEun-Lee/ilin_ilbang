<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="./includes/header.jsp" %>

    <section id="roomLike">
        <div class="sp_container">
  			<div class="sp_nav">
  				<div>관심 목록</div>
  				<ul>
  					<li><a href="">등록한 방</a></li>
  					<!--  <li><a>완료된 거래</a></li> -->
  				</ul>
  			</div><!-- .sp_nav  -->
  			<div class="subpage_content like_content">
  				<div class="sc_menu">
  					<h3 class="sc_title">관심목록 > 찜 목록</h3>
  					<div class="sc_wrap">
  						<div class="like_sum">
  							<span class="style">${mid}님</span>이 찜하신 방은
  							총 <span class="style">${pageMaker.total}개</span>입니다.
  						</div>
  					</div><!-- sc_wrap -->
  				</div><!-- .sc_menu -->
  				<div class="list_select list_select_like">
                	<div class="all_ck">
	                    <label class="ck_container">
	                        <input type="checkbox" name="selectall">
	                        <span class="checkmark"></span>
	                        <span class="name">전체선택</span>
	                    </label>
                    </div>
                    <div>
                    	<a href="" class="sel_delete">선택삭제</a>
                	</div>
  				</div><!-- .list_select -->
  				<div class="like_list list_content">
  					<ul>
	  					<c:forEach items="${list}" var="room">
							<li class="room">
								<a class="room_detail" href="javascript:void(0);"
								   onclick='window.open("/<c:out value='${room.rcode}'/>", "_blank", "width=600px", "height=500px")'>
									<div class="room_card">
				        				<div class="card_box">
				        					<img class="room_img" src="../resources/img/room_ex.png" alt="">
				        					<div class="ck_box">
				        						<label class="ck_container">
					        						<input type="checkbox" name="selected" value="${room.rcode}">
					        						<span class="checkmark"></span>
				        						</label>
				        					</div>
				        					<div>
				        						<a class="btn_like">찜!</a>
				        						<span style="display:none;">${room.rcode}</span>
				        					</div>
				        				</div><!-- card_box -->     				
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
  				</div><!-- .like_list lits_content -->
  			</div><!--.subpage_content .like_content -->
		 </div><!-- .sp_container -->
    </section><!-- #sub_page1 -->
    
    
      <!-- 찜 버튼 클릭시 모달창 입니다 -->
	 <div class="modal_like">
			<div class="modal_text">
				<span class='modal_rcode'></span> 번 방이 관심 목록에 추가되었습니다.<br> 찜 목록으로 이동하시겠어요?
			</div>
			<div class="modal_btn_box">
				<a href="/roomLike" class="modal_btn_1">관심목록으로 이동</a>
				<a class="modal_btn_2">아니요, 더 둘러볼게요.</a>
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
	 
	 <!-- 관심목록 여러개 삭제 모달창입니다 -->
	  <div class="modal_dislike modal_dislike_mul">
	 		<div class="modal_text">
	 			선택된 방이 삭제되었습니다.
	 		</div>
	 		<div class="modal_btn_box">
	 			<a class="modal_btn_2">확인</a>
	 		</div>
	 		<div class="modal_close">창 닫기</div>
	 </div><!-- .modal_dislike -->

<script src="${pageContext.request.contextPath}/resources/js/roomLike.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<%@include file="./includes/footer.jsp" %>
