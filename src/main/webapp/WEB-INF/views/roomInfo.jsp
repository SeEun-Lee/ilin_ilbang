<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 팝업창 Jquery, css 다시 연결했습니다 -->
<!--jQuery 연결-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--jQuery UI 연결-->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- 카카오 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6dfe001c629e5c1942f7fb1c1c822003&libraries=services"></script>

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/roomInfo.css" rel="stylesheet" type="text/css">

	<form id="operForm" action="/listWithPage" method="get">
        <div class="room_info_in">
        
            <div class="ms_title">
            	<h2 class="rcode">매물 번호 <span class="style">${Info.rcode}</span></h2>
                <a class="close" 
                   style="background-image: url(${pageContext.request.contextPath}/resources/img/btn_close.png);"
                   onClick="window.close()">닫기</a>
            </div><!-- ms_title -->
            
            <div class="ms_contant1">
                <div class="msc1_img">
                    <div class="img_slide">
                        <div><img src="${pageContext.request.contextPath}/resources/img/room_ex2.jpg" alt=""></div>
                        <div><img src="${pageContext.request.contextPath}/resources/img/room_ex3.jpg" alt=""></div>
                    </div>
                    <div class="slick_arr">
                        <div class="arr_prev">이전</div>
                        <div class="arr_next">다음</div>
                    </div>
                    <div class="msc1_img_inside">
                        <div class="inside_1">
                            <span class="price">${Info.dep}/${Info.mrent}</span>
                            <span class="rtype">
                                <c:choose>
	               					<c:when test="${Info.rtype=='o'}">
	               						<span>원룸</span>
	               					</c:when>
	               					<c:when test="${Info.rtype=='t'}">
	               						<span>투룸</span>
	               					</c:when>
               				</c:choose>
                            </span>
                            <span class="addr">
                                <c:set var="address" value="${Info.addr}"/>
                                    ${fn:split(address," ")[0]}
                                    ${fn:split(address," ")[1]}
                                    ${fn:split(address," ")[2]}
                            </span>
                        </div>
                    </div>
                    <div class="msc1_like">찜!</div>
                </div><!--.msc1_img-->

                <div class="msc1_box">
                    <ul>
                        <li class="msc1_box_img"></li>
                        <li class="msc1_box_t1"><span class="agt_name">담당자 : 그린이</span></li>
                        <li class="msc1_box_t2"><span class="agt_call">연락처 : 010-5648-4561</span></li>
                        <li class="msc1_box_t3"><span class="agt_style">기관 : 그린공개중개사무소</span></li>
                        <li class="msc1_box_t4"><span class="agt_style">주소 : 울산광역시 남구 삼산동</span></li>    
                    </ul>         
               </div>
                 <div class="deal">거래하기</div>
            </div><!-- ms_contant1 -->
            <div class="ms_contant2">
                <h2 class="ms2_title">매물 상세정보</h2>
                 	<table border="1">
               		<tr>
               			<td class="td_name"><span>보증금/월세</span></td>
               			<td class="td_value price">
               				<span>${Info.dep}</span>
               				<span>/</span>
               				<c:choose>
               					<c:when test="${Info.dtype=='m'}">
               						<span>${Info.mrent}</span>
               					</c:when>
               					<c:when test="${Info.dtype=='y'}">
               						<span>${Info.yrent}</span>
               					</c:when>
               				</c:choose>
               			</td>
               			<td class="td_name"><span>방종류</span></td>
               			<td class="td_value">
               				<c:choose>
               					<c:when test="${Info.rtype=='o'}">
               						<span>원룸</span>
               					</c:when>
               					<c:when test="${Info.rtype=='t'}">
               						<span>투룸</span>
               					</c:when>
               				</c:choose>
               			</td>
               		</tr>
               		<tr>
               			<td class="td_name"><span>면적</span></td>
               			<td class="td_value">
                               ${Info.area}
                               <span>평</span>
                        </td>
               			<td class="td_name"><span>층수</span></td>
               			<td class="td_value">${Info.flr}</td>
               		</tr>
               		<tr>
               			<td class="td_name"><span>입주가능일</span></td>
               			<td class="td_value">
               				<c:choose>
               					<c:when test="${Info.mvable eq 'Y'}">
               						<span>즉시입주가능</span>
               					</c:when>
               					<c:when test="${Info.mvable!='Y'}">
               						<span>${Info.mvdate}</span>
               					</c:when>
               				</c:choose>
						</td>
               			<td class="td_name"><span>방향</span></td>
               			<td class="td_value">
               			     <c:choose>
               					<c:when test="${Info.rface=='e'}">
               						<span>동향</span>
               					</c:when>
               					<c:when test="${Info.rface=='w'}">
               						<span>서향</span>
               					</c:when>
               					<c:when test="${Info.rface=='s'}">
               						<span>남향</span>
               					</c:when>
               					<c:when test="${Info.rface=='n'}">
               						<span>북향</span>
               					</c:when>
               				</c:choose>
               			</td>
               		</tr>
               		<tr>
               			<td class="td_name"><span>주차</span></td>
               			<td class="td_value">
               				<c:choose>
               					<c:when test="${Info.park eq 'Y'}">
               						<span>주차가능</span>
               					</c:when>
               				</c:choose>
               				<c:choose>
               					<c:when test="${Info.park eq 'N'}">
               						<span>주차불가능</span>
               					</c:when>
               				</c:choose>
               			</td>
               			<td class="td_name"><span>엘리베이터</span></td>
               			<td class="td_value">
               				<c:choose>
               					<c:when test="${Info.elev eq 'Y'}">
               						<span>엘리베이터 있음</span>
               					</c:when>
               				</c:choose>
               				<c:choose>
               					<c:when test="${Info.elev eq 'N'}">
               						<span>엘리베이터 없음</span>
               					</c:when>
               				</c:choose>
						</td>
					</tr>
               		<tr>
                        <td class="td_name"><span>반려동물</span></td>
                        <td class="td_value">
                            <c:choose>
                                <c:when test="${Info.pet eq 'Y'}">
                                    <span>가능</span>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${Info.pet eq 'N'}">
                                    <span>불가능</span>
                                </c:when>
                            </c:choose>
                        </td>
               			<td class="td_name"><span>건물종류</span></td>
               			<td class="td_value">
               				<c:choose>
               					<c:when test="${Info.btype=='s'}">
               						<span>단독주택</span>
               					</c:when>
               					<c:when test="${Info.btype=='m'}">
               						<span>다세대주택</span>
               					</c:when>
               					<c:when test="${Info.btype=='o'}">
               						<span>오피스텔·도시형생활주택</span>
               					</c:when>
               				</c:choose>
               			</td>
               		</tr>
               	</table>
            </div><!-- ms_contant2 -->
            <div class="ms_contant3">
                <h2 class="ms3_title"><span>옵션</span></h2>
                <ul>
                	<c:if test="${Info.ac eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/ac.png);"></span>
                                <span class="op_name">에어컨</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.washer eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/washer.png);"></span>
                                <span class="op_name">세탁기</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.tv eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/tv.png);"></span>
                                <span class="op_name">TV</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.stove eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/stove.png);"></span>
                                <span class="op_name">가스레인지</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.microw eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/microw.png);"></span>
                                <span class="op_name">전자레인지</span>
                            </div>
                        </li>
                	</c:if>
                    <c:if test="${Info.bed eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/bed.png);"></span>
                                <span class="op_name">침대</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.desk eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/desk.png);"></span>
                                <span class="op_name">책상</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.closet eq 'Y'}">
                	    <li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/closet.png);"></span>
                                <span class="op_name">옷장</span>
                            </div>
                        </li>
                	</c:if>
                	<c:if test="${Info.shelf eq 'Y'}">
                		<li>
                            <div class="ms3_op on">
                                <span class="op_img" style="background-image: url(${pageContext.request.contextPath}/resources/img/option/shelf.png);"></span>
                                <span class="op_name">신발장</span>
                            </div>
                        </li>
                	</c:if>
                </ul>
            </div><!-- ms_contant3 -->
            <div class="ms_contant4">
                <form action="">
                    <h2 class="ms4_title">담당자 코멘트</h2>
                    <div class="ms4_memo">
                        ${Info.rcont}
                    </div>
                </form>
            </div><!-- ms_contant4 -->
            <div class="ms_contant5">
                <h2 class="ms5_title">위치 정보</h2>
                <div class="map_img" id="info_map"></div>
                <div class="ms5_btns">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div><!-- ms_contant5 -->
        </div><!-- room_info_in -->
    </form><!-- #room_info -->
    
    
<script>

$(document).ready(function(){
	
	$('.img_slide').slick({
	    
	    prevArrow : $('.arr_prev'),
	    nextArrow : $('.arr_next'),
	    // dots: true
	    dots:true,
	    dotsClass:'bn-controller',   // 사용자 css class ( 버튼들의 부모 엘리먼트 클래스를 가르킨다 )
	    customPaging: function(slide, i) {
	            // console.log( slide.$slider[0] )
	            //아래 마크업처럼 적용할 버튼들의 마크업을 대입하면 된다.
	
	            // slick내부에서 슬라이드 개수 만큼 for문으로 생성 ( 슬라이드 개수 만큼 복제된다. )
	            return '<div class="slide-banner">' +
	                ' <div class="bn-item"> 테스트 버튼'+(i+1)+ '</div>' +
	                '</div>'
	        }
	    }); // slick
	    
	    
	// 지도API
	var mapContainer = document.getElementById('info_map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var addr = "${Info.addr}"
	var rcode = "${Info.rcode}"

	geocoder.addressSearch(addr, function(result, status) {
		
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px; text-align:center; padding:6px 0;"> 등록번호 '
		            		 + rcode + '</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
	    	};
	    }); // geocoder.addressSearch();


}); // 

</script>
