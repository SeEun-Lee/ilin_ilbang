<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp" %>
<!-- 맵 js -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5e41121bb1d58e90b856ee43d16acfa9&libraries=services"></script>

<!-- 카카오 주소검색 api -->
<script language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <form role='form' method="post" action="room_register" id="room_register" enctype="multipart/form-data">
   	<div id="sub_page2">
       <div class="sp2_in">
            <div class="sp2_title">
                <h2 class="sp2_t">방 내놓기</h2>
            </div><!-- sp2_title -->
	            <div class="sp2_content1">
	                <div class="sc1_text">
	                    <p>★ 등록된 매물은 30일간 유지 됩니다</p>
	                    <p>★ 등록 후 바로 거래가능 합니다</p>
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
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="one" checked="checked" value="1"/>
	                                                <label class="button-label" for="one">원룸</label> 
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="two" value="2"/>
	                                                <label class="button-label" for="two">투룸</label>
	                                                    
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="three" value="3"/>
	                                                <label class="button-label" for="three">쓰리룸</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="apart" value="a"/>
	                                                <label class="button-label" for="apart">아파트</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rtype" id="opistel" value="o"/>
	                                                <label class="button-label" for="opistel">오피스텔</label>
	                                           
	                                            </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>건물 유형</th>
	                                    <td class="s1b_title">
	                                        <div class="container">
	                                            <div class="s1b_button">
	                                                <input class="hidden radio-label" type="radio" name="btype" id="dan" checked="checked" value="d" />
	                                                <label class="button-label" for="dan">단독주택</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="btype" id="dagagu" value="j"/>
	                                                <label class="button-label" for="dagagu">다가구주택</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="btype" id="builla" value="b"/>
	                                                <label class="button-label" for="builla">빌라</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="btype" id="sangga" value="s"/>
	                                                <label class="button-label" for="sangga">상가</label>
	                                            </div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
									    <th>방 방향</th>
									    <td class="s1b_title" >
										    <div class="container">
	                                            <div class="s1b_button">
	                                                <input class="hidden radio-label" type="radio" name="rface" id="east" checked="checked" value="e" />
	                                                <label class="button-label" for="east">동쪽</label> 
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rface" id="west" value="w"/>
	                                                <label class="button-label" for="west">서쪽</label>
	                                                    
	                                                <input class="hidden radio-label" type="radio" name="rface" id="south" value="s"/>
	                                                <label class="button-label" for="south">동쪽</label>
	                                                
	                                                <input class="hidden radio-label" type="radio" name="rface" id="north" value="n"/>
	                                                <label class="button-label" for="north">북쪽</label>
	
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
	                   		<input class="sb2_sec" type="button" value="주소 검색" id="btnAddr" name="btnAddr">
	                   		<input class="sb2_sec2" type="button" value= "위치 검색" id="btnAddr2" name="btnAddr2">
                   			<P class="sb2_zip"><label for="zip">우편번호 </label><input type="text" value="" name="zip" id="zip"></P>
                   			<P class="sb2_addr1"><label for="addr1">주소</label><input type="text" name="addr" id="addr1" value=""></P>		                   										  
							<input class="sb2_addsub" type="text" name="addsub" id="addr2" placeholder="상세주소를 입력하세요.">                   			
                   		</li> 
	                    <li class="sc2_box3">
	                    	<div id="staticMap" style="width:230px;height:230px;"></div>
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
	                                    <input class="hidden radio-label" type="radio" name="dtype" id="month" value="m" checked="checked"/>
	                                    <label class="button-label" for="month">월세</label> 
	                                    
	                                    <input class="hidden radio-label" type="radio" name="dtype" id="all" value="y"/>
	                                    <label class="button-label" for="all">전세</label>
	                                </div>
	                                <div class="texts texts1">
	                                    <p id="dep"><label for="dep1">보증금 : </label><input type="number" min="0" id="dep1" name="dep" value="0"><span>만원</span></p>
                              	        <p id="yrent"><label for="yrent1">전세금 : </label><input type="number" min="0" id="yrent1" name="yrent" value="0"><span>만원</span></p>
	                                    <p id="mrent"><label for="mrent1"> 월세 : </label><input type="number" min="0" id="mrent1" name="mrent" value="0"><span>만원</span></p>                    
	                                    <p id="mfeec"><label for="mfeec1">관리비 : </label><input type="number" min="0" id="mfeec1" name="mcfee" value="0"><span>만원</span></p>
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
	                                <input class="mdl-textfield__input" type="number" min="0" value="0" id="supply_pyeong" name="whlarea">
	                                <label class="mdl-textfield__label" tabindex="1" for="supply_pyeong"></label>
	                            	평
	                            </div>
	                        </td>
	                        <th rowspan="2">건물 층수</th>
	                        <td colspan="2">
	                            <span>건물 층수</span>
	                            <select id="buildingFloor" name="flr">
	                                <option>건물 층수 선택</option>
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                                <option value="4">4</option>
	                                <option value="5">5</option>
	                                <option value="6">6</option>
	                                <option value="7">7</option>
	                                <option value="8">8</option>
	                                <option value="9">9</option>
	                                <option value="10">10</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="sc_flex" colspan="2">
	                            <span>전용 면적</span>
	                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
	                                <input class="mdl-textfield__input" type="number" min="0" value="0" id="public_pyeong" name="area">
	                                <label class="mdl-textfield__label" tabindex="2" for="public_pyeong"></label>
	                            	평
	                            </div>
	                        </td>
	                        <td colspan="2">
	                            <span>해당 층수</span>
	                            <select id="myfloor" name="myflr">
	                                <option>해당 층수 선택</option>
	                                <option value="1">1</option>
	                                <option value="2">2</option>
	                                <option value="3">3</option>
	                                <option value="4">4</option>
	                                <option value="5">5</option>
	                                <option value="6">6</option>
	                                <option value="7">7</option>
	                                <option value="8">8</option>
	                                <option value="9">9</option>
	                                <option value="10">10</option>
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
	                                    <input class="hidden radio-label" type="radio" name="park" id="no_parking" value="N" checked="checked"/>
	                                    <label class="button-label" for="no_parking">없음</label>
	                                    
	                                    <input class="hidden radio-label" type="radio" name="park" id="yes_parking" value="Y"/>
	                                    <label class="button-label" for="yes_parking">있음</label>
	                                    <div style="clear:both;"></div>
	                                </div>
	                            </div>
	                        </td>
	                    
	                        <th>반려동물</th>
		                        <td colspan="3">
		                            <div class="container">
		                                <div class="buttons">
		                                    <input class="hidden radio-label" type="radio" name="pet" id="no_pet" value="N" checked="checked"/>
		                                    <label class="button-label" for="no_pet">없음</label>
		                                    
		                                    <input class="hidden radio-label" type="radio" name="pet" id="yes_pet" value="Y"/>
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
	                                        <input class="hidden radio-label" type="radio" name="elev" id="no_elevator" value="N" checked="checked"/>
	                                        <label class="button-label" for="no_elevator">없음</label>
	                                        
	                                        <input class="hidden radio-label" type="radio" name="elev" id="yes_elevator" value="Y"/>
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
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="ac" id="option_air"  />
	                                <label class="button-label" for="option_air">에어컨</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="washer" id="option_washer"  />
	                                <label class="button-label" for="option_washer">세탁기</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="bed" id="option_bed" />
	                                <label class="button-label" for="option_bed">침대</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="desk" id="option_desk"  />
	                                <label class="button-label" for="option_desk">책상</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="closet" id="option_closet"  />
	                                <label class="button-label" for="option_closet">옷장</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="tv" id="option_TV"  />
	                                <label class="button-label" for="option_TV">TV</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="shelf" id="option_shoes" />
	                                <label class="button-label" for="option_shoes">신발장</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="fridge" id="option_refrigerator"  />
	                                <label class="button-label" for="option_refrigerator">냉장고</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="stove" id="option_gasrange" />
	                                <label class="button-label" for="option_gasrange">가스레인지</label>
	                                
	                                <input class="hidden optionlist button-label" type="checkbox" value="Y" name="microw" id="option_microwave"  />
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
	                        <p><input type="text" name="rcmt" placeholder=" 예) 롯데백화점 5분거리"></p>
	                        <p><input type="text" name="rcont"></p>
	                        <p><input type="text" name="mvdate" placeholder=" 입주가 가능한 날을 쓰시오"></p>
	                    </div>
	                </div>
	            </div><!-- .sp2_content6 -->
	            <div class="sp2_content7">
                	<h3 class="sc_title">사진등록</h3>
	          
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							<div class="uploadResult">
								<ul>
								</ul>
							</div>
						</div>
					</div>

		           	<div class="sc7_btns">
		           		<div class="room_ck">
			           		<input id="submit_ck" name="check_submit" type="checkbox">
			           		<label for="submit_ck">매물 관련 규정을 확인하였으며, 입력한 정보는 실제와 다름이 없습니다.</label>
		           		</div>
		               	<button class="cs"><a href="http://localhost:8080/">등록취소</a></button>
		               	<button id="room_submit" type="submit">등록하기</button>
		           	</div>
	            </div><!-- .sp2_content7 -->
	        </div><!-- .sp2_in -->
	    </div><!-- #sub_page2 -->
	</form>     
<%@include file="./includes/footer.jsp" %>