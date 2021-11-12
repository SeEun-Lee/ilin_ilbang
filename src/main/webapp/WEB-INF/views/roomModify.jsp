<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 팝업창 Jquery css 다시 연결 -->

<!--jQuery 연결-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--jQuery UI 연결-->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/room_register.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/roomModify.css" rel="stylesheet" type="text/css">

<div class="wrap" id="roomModify">
  <form role="form" id="room_Modify">
   	<div id="sub_page2">
       <div class="sp2_in">
            <div class="sp2_title">
                <h2 class="sp2_t">방 수정하기</h2>
                <a class="close" 
                   style="background-image: url(${pageContext.request.contextPath}/resources/img/btn_close.png);"
                   onClick="window.close()">닫기</a>
            </div><!-- sp2_title -->
            <div class="sp2_content1">
                <div class="sc1_text">
                	<div class="row1">
                		<span class="style rcode">${info.rcode}</span>번 방을 수정합니다.
                	</div>
                	<div class="row2">
                		수정한 내용은 즉시 반영되니 신중하게 수정해주세요!
                	</div>
                	<div class="row3">
                		<p>등록일 : ${info.regdate}</p>
                		<p>마지막 수정일 : ${info.updatedate}</p>
                	</div>
                </div>
	                    <div class="sc1_box">
	                        <table class="sc_box">
							    <thead>
	                                <span class="sc_title">매물 정보</span>
								    <tr>
									    <th>종류 선택</th>
									    <td  class="s1b_title" >
										    <div class="container">
	                                            <div class="s1b_button">
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="one" 
	                                                	   <c:if test="${info.rtype == 'o'}">checked="checked"</c:if> value="o"/>
	                                                <label class="button-label" for="one">원룸</label> 
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="two"
	                                               		   <c:if test="${info.rtype == 't'}">checked="checked"</c:if> value="t"/>
	                                                <label class="button-label" for="two">투룸</label>
	                                            </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>건물 유형</th>
	                                    <td class="s1b_title">
	                                        <div class="container">
	                                            <div class="s1b_button">
	                                                <input class="hidden radio-label" type="radio" name="btype" id="dan" 
	                                                	   <c:if test="${info.btype == 's'}">checked="checked"</c:if> value="s" />
	                                                <label class="button-label" for="dan">단독주택</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="btype" id="dagagu" 
	                                                	   <c:if test="${info.btype == 'm'}">checked="checked"</c:if> value="m"/>
	                                                <label class="button-label" for="dagagu">다가구주택</label>
                                 
	                                                <input class="hidden radio-label" type="radio" name="btype" id="officetel" 
	                                                	   <c:if test="${info.btype == 'o'}">checked="checked"</c:if> value="o"/>
	                                                <label class="button-label" for="officetel">오피스텔</label>
	                                            </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
									    <th>방 방향</th>
									    <td class="s1b_title" >
										    <div class="container">
	                                            <div class="s1b_button">
	                                                <input class="hidden radio-label" type="radio" name="rface" id="east"
	                                                	   <c:if test="${info.rface == 'e'}">checked="checked"</c:if> value="e" />
	                                                <label class="button-label" for="east">동향</label> 
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rface" id="west" 
	                                                	   <c:if test="${info.rface == 'w'}">checked="checked"</c:if> value="w"/>
	                                                <label class="button-label" for="west">서향</label>
	                                                    
	                                                <input class="hidden radio-label" type="radio" name="rface" id="south" 
	                                                	   <c:if test="${info.rface == 's'}">checked="checked"</c:if> value="s"/>
	                                                <label class="button-label" for="south">남향</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rface" id="north" 
	                                                	   <c:if test="${info.rface == 'n'}">checked="checked"</c:if> value="n"/>
	                                                <label class="button-label" for="north">북향</label>
	
	                                            </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                            </thead>
	                        </table>
	                    </div>
	               	</div><!-- .sp2_content1 -->
	            <div class="sp2_content2">
	                <h3 class="sc_title">위치정보</h3>
	                <ul>
	                    <li class="sc2_box1">주소 검색</li>
	                    <li class="sc2_box2">
	                        <div class="sb2_text">★ 도로명, 지역별, 건물명 등으로 검색이 가능하다.</div>
	                        <button class="sb2_sec">주소검색</button>
	                        <p><input type="text" name="addr" value="${info.addr}"></p>
	                        <p><input type="text" name="addsub" class="sb2_memo" value="${info.addsub}"></p>
	                    </li>
	                    <li class="sc2_box3">
	                        <div class="img">지도</div>
	                    </li>
	                </ul>
	            </div><!-- .sp2_content2 -->
	            <div class="sc3_box">
	                <h3 class="sc_title">거래 종류</h3>
	                <table class="sc_box">
	                    <tr>
	                        <th>거래 종류</th>
	                        <td>
	                            <div class="container">
	                                <div class="buttons" >
	                                    <input class="hidden radio-label" type="radio" name="dtype" id="month" value="m"
	                                    	   <c:if test="${info.dtype == 'm'}">checked="checked"</c:if>/>
	                                    <label class="button-label" for="month">월세</label> 
	                                    
	                                    <input class="hidden radio-label" type="radio" name="dtype" id="year" value="y"
	                                    	   <c:if test="${info.dtype == 'y'}">checked="checked"</c:if>/>
	                                    <label class="button-label" for="year">전세</label>
	                                </div>
	                                <div class="texts texts1">
	                                    <p id="dep"><label for="dep1">보증금 : </label><input type="number" min="0" id="dep1" name="dep" value="${info.dep}"><span>만원</span></p>
                              	        <p id="yrent"><label for="yrent1">전세금 : </label><input type="number" min="0" id="yrent1" name="yrent" value="${info.yrent}"><span>만원</span></p>
	                                    <p id="mrent"><label for="mrent1"> 월세 : </label><input type="number" min="0" id="mrent1" name="mrent" value="${info.mrent}"><span>만원</span></p>                    
	                                    <p id="mfeec"><label for="mfeec1">관리비 : </label><input type="number" min="0" id="mfeec1" name="mcfee" value="${info.mcfee}"><span>만원</span></p>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                </table>
	            </div><!-- .sp2_content3 -->
	            <div class="sc4_box">
	                <span class="sc_title">기본정보</span>
	                <table class="sc_box">  
	                    <tr>
	                        <th rowspan="2">건물 크기<br>(1P=3.3058m<sup>2</sup>)</th>
	                        <td class="sc_flex">
	                            <span>공급 면적</span>
	                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                <input class="mdl-textfield__input" type="number" id="supply_pyeong" name="whlarea" value="${info.whlarea}">
	                                <label class="mdl-textfield__label" tabindex="1" for="supply_pyeong"></label>
	                            	평
	                            </div>
	                        </td>
	                        <th rowspan="2">건물 층수</th>
	                        <td colspan="2">
	                            <span>건물 층수</span>
	                            <select id="buildingFloor" name="flr" value="${info.flr}">
	                                <option>건물 층수 선택</option>
	                                <option value="1" <c:if test="${info.flr == 1}">selected</c:if>>1</option>
	                                <option value="2" <c:if test="${info.flr == 2}">selected</c:if>>2</option>
	                                <option value="3" <c:if test="${info.flr == 3}">selected</c:if>>3</option>
	                                <option value="4" <c:if test="${info.flr == 4}">selected</c:if>>4</option>
	                                <option value="5" <c:if test="${info.flr == 5}">selected</c:if>>5</option>
	                                <option value="6" <c:if test="${info.flr == 6}">selected</c:if>>6</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="sc_flex" colspan="2">
	                            <span>전용 면적</span>
	                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                <input class="mdl-textfield__input" type="number" id="public_pyeong" value="${info.area}" name="area">
	                                <label class="mdl-textfield__label" tabindex="2" for="public_pyeong"></label>
	                            	평
	                            </div>
	                        </td>
	                        <td colspan="2">
	                            <span>해당 층수</span>
	                            <select id="myfloor" name="myflr">
	                                <option>해당 층수 선택</option>
	                                <option value="1" <c:if test="${info.myflr == 1}">selected</c:if>>1</option>
	                                <option value="2" <c:if test="${info.myflr == 2}">selected</c:if>>2</option>
	                                <option value="3" <c:if test="${info.myflr == 3}">selected</c:if>>3</option>
	                                <option value="4" <c:if test="${info.myflr == 4}">selected</c:if>>4</option>
	                                <option value="5" <c:if test="${info.myflr == 5}">selected</c:if>>5</option>
	                                <option value="6" <c:if test="${info.myflr == 6}">selected</c:if>>6</option>
	                            </select>
	                        </td>
	                    </tr>
	                </table>
	            </div><!-- .sc4_box -->
            	<div class="sc5_box">
                	<span class="sc_title">추가정보</span>
	                <table class="sc_box">
	                    <tr>
	                        <th>주차여부</th>
	                        <td colspan="3">
	                        
	                            <div class="container">
	                                <div class="buttons" >
	                                    <input class="hidden radio-label" type="radio" name="park" id="no_parking" value="N" 
	                                    	   <c:if test="${info.park eq 'N'}">checked="checked"</c:if>/>
	                                    <label class="button-label" for="no_parking">없음</label>
	                                    
	                                    <input class="hidden radio-label" type="radio" name="park" id="yes_parking" value="Y"
	                                    	   <c:if test="${info.park eq 'Y'}">checked="checked"</c:if>/>
	                                    <label class="button-label" for="yes_parking">있음</label>
	                                    <div style="clear:both;"></div>
	                                </div>
	                            </div>
	                        </td>
	                    
	                        <th>반려동물</th>
		                        <td colspan="3">
		                            <div class="container">
		                                <div class="buttons">
		                                    <input class="hidden radio-label" type="radio" name="pet" id="no_pet" value="N"
		                                     	   <c:if test="${info.pet eq 'N'}">checked="checked"</c:if>/>
		                                    <label class="button-label" for="no_pet">없음</label>
		                                    
		                                    <input class="hidden radio-label" type="radio" name="pet" id="yes_pet" value="Y"
		                                    	   <c:if test="${info.pet eq 'Y'}">checked="checked"</c:if>/>
		                                    <label class="button-label" for="yes_pet">있음</label>
		                                </div>
		                            </div>
		                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th>엘리베이터</th>
	                            <td colspan="3">
	                                <div class="container">
	                                    <div class="buttons">
	                                        <input class="hidden radio-label" type="radio" name="elev" id="no_elevator" value="N" 
	                                        	   <c:if test="${info.elev eq 'N'}">checked="checked"</c:if>/>
	                                        <label class="button-label" for="no_elevator">없음</label>
	                                        
	                                        <input class="hidden radio-label" type="radio" name="elev" id="yes_elevator" value="Y"
	                                        	   <c:if test="${info.elev eq 'Y'}">checked="checked"</c:if>/>
	                                        <label class="button-label" for="yes_elevator">있음</label>
	                                    </div>
	                                </div>
	                            </td>
	                    </tr>
	                    <tr>
	                        <th>옵션항목</th>
	                            <td colspan="6">
	                            <div class="container">
	                                <div class="buttons" id="optionlist">
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="ac" id="option_air"
	                                	   <c:if test="${info.ac eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_air">에어컨</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="washer" id="option_washer"
	                                	   <c:if test="${info.washer eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_washer">세탁기</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="bed" id="option_bed"
	                                	   <c:if test="${info.bed eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_bed">침대</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="desk" id="option_desk"
	                                	   <c:if test="${info.desk eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_desk">책상</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="closet" id="option_closet"
	                                	   <c:if test="${info.closet eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_closet">옷장</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="tv" id="option_TV"
	                                	   <c:if test="${info.tv eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_TV">TV</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="shelf" id="option_shoes"
	                                	   <c:if test="${info.shelf eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_shoes">신발장</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="fridge" id="option_refrigerator"
	                                	   <c:if test="${info.fridge eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_refrigerator">냉장고</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="stove" id="option_gasrange"
	                                	   <c:if test="${info.stove eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_gasrange">가스레인지</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="microw" id="option_microwave"
	                                	   <c:if test="${info.microw eq 'Y'}">checked="checked"</c:if>/>
	                                <label class="button-label" for="option_microwave">전자레인지</label>
	                                
	                                </div>
	                            </div>
	                            </td>
	                    </tr>
	                </table>
	            </div><!-- .sc5_box -->
	            <div class="sp2_content6">
	                <h3 class="sc_title">상세설명</h3>
	                <div class="sc6_box">
	                    <div class="sb6_l">
	                        <p>제목</p>
	                        <p>상세 설명</p>
	                        <p>입주 가능일</p>
	                    </div>
	                    <div class="sb6_r">
	                        <p><input type="text" name="rcmt" value="${info.rcmt}"></p>
	                        <p><input type="text" name="rcont" value="${info.rcont}"></p>
	                        <p><input type="text" name="mvdate" value="${info.mvdate}"></p>
	                    </div>
	                </div>
	            </div><!-- .sp2_content5 -->
	            <div class="sp2_content7">
	                <h3 class="sc_title">사진등록</h3>
	
					<div class='uploadDiv'>
						<input type='file' name='uploadFile' multiple>
					</div>
					
					<div class='uploadResult'>
						<ul>
					
						</ul>
					</div>
					<div class="uBtn">
						<input class="hidden optionlist button-label" type="button" id="uploadBtn"/>
	                    <label class="button-label" for="uploadBtn">올리기</label>
		           	</div>
		           	<div class="sc7_btns">
	                	<label for="check"><input type="checkbox" id="check">매물등록 규정을 확인 했으며, 등록한 정보는 실제와 다름이 없습니다.</label>
		               	<div>
			               	<button type="button" id="btn_cancel">수정취소</button>
			               	<button type="button" id="btn_modify">수정하기</button>
		               	</div>
		           	</div>
	            </div><!-- .sp2_content7 -->
	        </div><!-- .sp2_in -->
	    </div><!-- #sub_page2 -->
	</form>
	<div class="modal_modify">
		<div class="modal_text">
			정상적으로 수정되었습니다.<br> 수정한 내용을 확인할까요?
		</div>
		<div class="modal_btn_box">
			<a class="modal_btn_1">아니요.</a>
			<a class="modal_btn_2">네, 확인할게요.</a>
		</div>
		<div class="modal_close">창 닫기</div>
	</div> <!-- .modal_modify -->
	<div class="modal_cancel">
		<div class="modal_text">
			취소할 시 현재 내용은 저장되지 않습니다.<br>정말 창을 닫으시겠어요?
		</div>
		<div class="modal_btn_box">
			<a class="modal_btn_1">네, 닫겠습니다.</a>
			<a class="modal_btn_2">아니요.</a>
		</div>
		<div class="modal_close">창 닫기</div>
	</div> <!-- .modal_cancel -->
</div><!-- .wrap -->


<script src="${pageContext.request.contextPath}/resources/js/roomModify.js"></script>