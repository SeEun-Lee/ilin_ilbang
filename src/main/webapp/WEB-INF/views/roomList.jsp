<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- js -->
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/filter.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/map.js"></script>


	
	<div class="list_container" id="list_container">
		   <div class="list_content" id="list_content">
		   		<div class="title">
		   			<h2>${title}</h2>
		   			<span class="count">(${total}건)</span>
		   		</div>
		        <ul>
		            <c:forEach items="${list}" var="room">
						<li class="room">
						<!-- <a class='room_detail' href="/<c:out value='${room.rcode}'/>"> -->
						<!-- 		 <a class="room_detail" href="javascript:void(0);"
							    onclick='window.open("/<c:out value='${room.rcode}'/>", 
							    		'_blank', 'width=600', height='500')'>
						 -->
						 
						 <a class="room_detail" href="javascript:void(0);"
						 onclick='window.open("/<c:out value='${room.rcode}'/>", "_blank", "width=600", "height=500")'>
					
			    				<div class="room_card">
			        				<div class="card_box">
			        					<img class="room_img" src="../resources/img/room_ex.png" alt="">
			        					<div class="find_map">
			        						<a href="">위치보기</a>
			        						<span style="display:none">${room.rcode}</span>
			        					</div>
			        					<div class="find_addr" style="display:none">${room.addr}</div>
			        					<div class="like">찜!</div>
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
		<div class="map_wrap" style="position:fixed; top:190px; right:270px;">
    		<div id="map" style="width:400px;height:400px;position:relative;overflow:hidden;"></div>
		</div><!-- "map_wrap" -->
		
	</div><!-- .list_container -->
	

	
	
	<!-- 
			   <div class="pagination">
	    	<ul>
	    		<c:if test="${pageMaker.prev}">
		    		<li class="page-item">
	                   <a href="#" class="page-move" value="prev">
	                     <span>이전</span>
	                   </a>
	                 </li>
	    		</c:if>

                 <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                 <li class="page-item">
	                 	<a href="#" class="page-number <c:if test='${num == 1}'>on</c:if>" value="${num}">${num}</a>
	                 </li>         
                 </c:forEach>
                 
	    		<c:if test="${pageMaker.next}">
		    		<li class="page-item">
	                   <a href="#" class="page-move" value="next">
	                     <span>다음</span>
	                   </a>
	                 </li>
	    		</c:if>  
	         </ul>
	         <!-- 
	         <form id='actionForm' action="/board/list" method='get'>
	         	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	         	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	         </form>
	          -->
		    </div>
	 -->


	<script>
	
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


