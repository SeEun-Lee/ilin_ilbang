<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@include file="./includes/header.jsp" %>

	<form action="register" method="post">
        <div class="room_info_in">
            <div class="ms_title">
                <h2 class="ms_t">
                   	 <span class="title">${Info.rcmt}</span>
                   	 <span class="rcode">[등록 번호 : ${Info.rcode}]</span>
                </h2>
                <p class="back"><a href="#">목록으로</a></p>
            </div><!-- ms_title -->
            <div class="ms_contant1">
                <div class="msc1_img">
                    <img src="../resources/img/room_info.png" alt="">
                    <div class="heart"><a href="#"></a></div>
                    <p class="msc1_img_text">
                    <span class="addr">
						<c:set var="address" value="${Info.addr}"/>
							${fn:split(address," ")[0]}
							${fn:split(address," ")[1]}
							${fn:split(address," ")[2]}
					</span>
                    
                    </p>
                </div>
                <div class="msc1_box">
                    <ul>
                        <li class="msc1_box_img"><img src="../resources/img/main_sub_contant_box_img  .png" alt=""></li>
                        <li class="msc1_box_t1">담당자 : <span>그린이</span></li>
                        <li class="msc1_box_t2">연락처 : <span>010-5648-4561</span></li>
                        <li class="msc1_box_t3">기관 : <span>그린공개중개사무소</span></li>
                        <li class="msc1_box_t4">주소 : <span>울산광역시 남구 ....</span></li>    
                    </ul>         
               </div>
                <button type="button" class="msc1_btn1">관심 목록 추가</button>
                <button type="button" class="msc1_btn2">거래 하기</button>
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
               					<c:when test="${Info.dtype=='M'}">
               						<span>${Info.mrent}</span>
               					</c:when>
               					<c:when test="${Info.dtype=='Y'}">
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
               			<td class="td_value">${Info.rface}</td>
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
                		<li><p class="ms3_op on">에어컨</li>
                	</c:if>
                	<c:if test="${Info.washer eq 'Y'}">
                		<li><p class="ms3_op on">세탁기</li>
                	</c:if>
                	<c:if test="${Info.tv eq 'Y'}">
                		<li><p class="ms3_op on">TV</li>
                	</c:if>
                	<c:if test="${Info.stove eq 'Y'}">
                		<li><p class="ms3_op on">가스레인지</li>
                	</c:if>
                	<c:if test="${Info.microw eq 'Y'}">
                		<li><p class="ms3_op on">전자레인지</li>
                	</c:if>
                    <c:if test="${Info.bed eq 'Y'}">
                		<li><p class="ms3_op on">침대</li>
                	</c:if>
                	<c:if test="${Info.desk eq 'Y'}">
                		<li><p class="ms3_op on">책상</li>
                	</c:if>
                	<c:if test="${Info.closet eq 'Y'}">
                		<li><p class="ms3_op on">옷장</li>
                	</c:if>
                	<c:if test="${Info.shelf eq 'Y'}">
                		<li><p class="ms3_op on">신발장</li>
                	</c:if>
                </ul>
            </div><!-- ms_contant3 -->
            <div class="ms_contant4">
                <form action="">
                    <h2 class="ms4_title">담당자 코멘트</h2>
                    <div class="ms4_memo">
                        ${Info.rcmt}
                    </div>
                </form>
            </div><!-- ms_contant4 -->
            <div class="ms_contant5">
                <h2 class="ms5_title">위치 정보</h2>
                <div class="map_img"></div>
                <div class="ms5_btns">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div><!-- ms_contant5 -->
        </div><!-- room_info_in -->
    </form><!-- #room_info -->

<%@include file="./includes/footer.jsp" %>