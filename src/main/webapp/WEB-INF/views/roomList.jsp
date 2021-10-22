<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		
		<div class="list_container" id="list_container">
		   <div class="list_content" id="list_content">
		        <ul>
		            <c:forEach items="${list}" var="room">
						<li>
							<a href='/${room.rcode}'>
			    				<div class="room_card">
			        				<div class="room_img"></div>
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
			                          	<span class="price_won">원</span>  
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
		</div><!--list_content-->
		<div class="map_wrap">
    		<div id="map" style="width:400px;height:400px;position:relative;overflow:hidden;"></div>
		</div><!-- "map_wrap" -->
	</div><!-- .list_container -->
	
	<!-- 카카오 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37e1a519b03d653d9f91c2b12ed7a87"></script>
	<!-- js -->
	<script src="${pageContext.request.contextPath}/resources/js/filter.js"></script>