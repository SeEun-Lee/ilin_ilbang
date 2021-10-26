<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="./includes/header.jsp" %>


<body>
    <header id="header">
    </header><!-- #header -->
    <section id="roomLike">
        <div class="sp1_container top_padding sp1_bg1">
            <div class="sp1_top">
                <div class="sp1_menu">
                    <ul>
                        <li class="sm_title1, on"><a href="/roomLike/recent">찜한 방</a></li>
                        <li class="sm_title2"><a href="" class="like">최근 본 방</a></li>
                    </ul>
                </div><!-- .sp1_menu -->
                <div class="now_page"><span>관심목록 > 찜한 방</span></div>
                <div class="title">
					<div class="title_text"><span class="mid">${mid}</span>님이 찜하신 방입니다!</div>
					<span class="title_count">(${total}건)</span>
				</div>
			</div><!-- .sp1_top -->
		 </div><!-- .sp1_container -->
		 <div class="sp1_container sp1_bg2">
   					<div class="list_content list_content_like" id="list_content">
						<div class="result" style="display: none;">${result}</div>
						<div class="isEmpty" style="display: none;">이런 방은 어떠세요?</div>				   		
						<ul>
							<c:forEach items="${list}" var="room">
								<li class="room">
									<a class="room_detail" href="javascript:void(0);"
									   onclick='window.open("/<c:out value='${room.rcode}'/>", "_blank", "width=600px", "height=500px")'>
										<div class="room_card">
					        				<div class="card_box">
					        					<img class="room_img" src="../resources/img/room_ex.png" alt="">
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
              		</div><!-- .list_content .list_content_like -->
            </div><!-- .sp1_container -->
            <div class="page2">
                <div class="sp1_menu">
                    <ul>
                        <li class="sm_title1"><a href="#">찜한 방</a></li>
                        <li class="sm_title2, on"><a href="#">최근 본 방</a></li>
                    </ul>
                </div><!-- .sp1_menu -->
                <div><!-- 내용 -->
                    <ul>
                        <li></li>
                    </ul>
                </div>
                <div class="sp1_btns">
                    <button class="sp1_prve">이전으로</button>
                    <button class="sp1_next">다음으로</button>
                </div>
            </div><!-- .page2 -->
        </div>
    </section><!-- #sub_page1 -->
</body>

<%@include file="./includes/footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>