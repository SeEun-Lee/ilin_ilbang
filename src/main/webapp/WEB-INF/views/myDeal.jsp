<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="./includes/header.jsp" %>

        <section id="myDeal">
             <div class="sp_container">
                <div class="sp_nav">
                    <div>거래관리</div>
                    <ul>
                        <li><a href="">등록한 방</a></li>
                        <li><a href="">완료된 거래</a></li>
                    </ul>
                </div><!--.sp_nav-->
                <div class="deal_content list_content_deal" id="list_content_deal">
                        <div class="deal_menu">
                            <h3 class="dm_title">거래관리 > 등록한 방</h3>
                            <div class="dm_wrap">
                                <div class="dm_welcome">
                                    <span class="style">${agntid}</span>님,
                                    어서오세요!
                                </div>
                                <div class="dm_sum">
                                    <div>
                                        <p class="name on_progress">진행중</p>
                                        <p class="count">${sum.onSaleCnt}</p>
                                    </div>
                                    <div>
                                        <p class="name complete">계약완료</p>
                                        <p class="count">${sum.soldCnt}</p>
                                    </div>
                                    <div>
                                        <p class="name total">총 등록매물</p>
                                        <p class="count">${sum.total}</p>
                                    </div>
                                </div>
                                <div>
                                    <a href="" class="search_open">
                                        검색 메뉴
                                        <span class="text">열기</span>
                                    </a>
                                </div>
                                <div class="dm_search">
                                    <div class="sc_container">
                                        <div class="sc_name">검색</div>
                                        <div class="sc_content">
                                            <div class="sc_row1">
                                                <div class="input_box">
                                                    <label class="rd_container">
                                                        <input type="radio" name="select" value="sel_rcode" class="dm_radio">
                                                        <span class="radiomark"></span>
                                                        <span class="name">등록번호</span>
                                                    </label>
                                                    <input type="text" placeholder="예) 00001" name="search" class="input_rcode">
                                                </div>
                                            </div>
                                            <div class="sc_row2">
                                                <div class="input_box">
                                                    <label class="rd_container">
                                                        <input type="radio" name="select" value="sel_cont" class="dm_radio">
                                                        <span class="radiomark"></span>
                                                        <span class="name">주소/제목/내용</span>
                                                    </label>
                                                    <select name="" id="cont_select" class="dm_select">
                                                        <option value="">- 선택 -</option>
                                                        <option value="addr">주소</option>
                                                        <option value="title">제목</option>
                                                        <option value="title_cmt">제목+내용</option>
                                                    </select>
                                                    <input type="text" placeholder="예) 울산 남구 삼산동" name="search" class="input_cont">
                                                </div>
                                            </div>
                                            <div class="sc_row3">
                                                <div class="input_box">
                                                    <span class="plusmark"></span>
                                                    <label class="rd_container">
                                                        <input type="radio" name="select" value="sel_regdate" class="dm_radio">
                                                        <span class="radiomark"></span>
                                                        <span class="name">등록일</span>
                                                    </label>
                                                    <input type="date" id="input_regdate" name="regdate" value="regdate" min="2000-01-01" max="2021-12-12">
                                                </div>
                                            </div>
                                        </div><!-- .sc_content -->
                                        <div class="sc_btn">
                                            <a href="" class="reset">초기화</a>
                                            <button type="" class="btn_search">검색</button>
                                        </div>
                                    </div><!--.sc_container-->
                                    <div class="sc_sortby"> 
                                        <div class="sc_name">정렬</div>
                                        <div class="sc_content sc_cont_sortby"> 
                                            <div class="input_box">
                                                <label class="rd_container">
                                                    <input type="radio" name="sortby" value="recent" class="dm_radio">
                                                    <span class="radiomark"></span>
                                                    <span class="name">최근 등록 순</span>
                                                </label>
                                            </div>
                                            <div class="input_box">
                                                <label class="rd_container">
                                                    <input type="radio" name="sortby" value="old" class="dm_radio">
                                                    <span class="radiomark"></span>
                                                    <span class="name">오래된 순</span>
                                                </label>
                                            </div>
                                            <div class="input_box">
                                                <label class="rd_container">
                                                    <input type="radio" name="sortby" value="like" class="dm_radio">
                                                    <span class="radiomark"></span>
                                                    <span class="name">찜 많은 순</span>
                                                </label>
                                            </div>
                                            <div class="input_box">
                                                <label class="rd_container">
                                                    <input type="radio" name="sortby" value="view" class="dm_radio">
                                                    <span class="radiomark"></span>
                                                    <span class="name">조회수 많은 순</span>
                                                </label>
                                            </div>
                                        </div><!-- .sc_content .sc_cont_sortby -->
                                    </div><!--.sc_sortby-->
                                </div><!--.dm_search-->
                            </div><!--.dm_wrap-->
                        </div>	<!--.deal_menu-->

                        <div class="list_sel">
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
                        </div> <!--.list_sel-->

                        <div class="deal_list">
                            <ul>
                            	<c:forEach items="${list}" var="room">
	                                <li>
	                                    <a href="javascript:void(0);"
	                                       onclick='window.open("/<c:out value='${room.rcode}'/>", "_blank", "width=600px", "height=500px")'>
	                                        <div class="deal_item">
	                                            <div class="card_head">
	                                                <img class="room_img" src="" alt="">
	                                                <div class="sel_ck">
	                                                    <label class="ck_container">
	                                                        <input type="checkbox" name="select">
	                                                        <span class="checkmark"></span>
	                                                    </label>
	                                                </div>
	                                                <div class="sel_progress">
	                                                    <select name="progress" id="progress" class="progress">
	                                                        <option value="">거래 가능</option>
	                                                        <option value="">계약 완료</option>
	                                                        <option value="">거래 중지</option>
	                                                    </select>
	                                                    <p class="info">?</p>
	                                                </div>
	                                                <div class="print_progress">
	                                                	<c:choose>
	                                                		<c:when test="${room.onsale=='Y'}">
	                                                			거래 가능
	                                                		</c:when>
	                                                		<c:when test="${room.onsale=='N'}">
	                                                			계약 완료
	                                                		</c:when>
	                                                	</c:choose>
	                                                </div>
	                                            </div><!--.card_head-->
	                                            <div class="item_container">
	                                                <div class="room_info1">
	                                                    <p>등록번호 : ${room.rcode}</p>
	                                                    <p>등록일 : ${room.regdate}</p>
	                                                    <p>수정일 : ${room.updatedate}</p>
	                                                
	                                                </div>
	                                                <div class="room_info2">
	                                                    <p>
	                                                    	가격 : ${room.dep}/
	                                                 		<c:choose>
	                                                 			<c:when test="${room.dtype=='m'}">
	                                                 				${room.mrent}
	                                                 			</c:when>
	                                                 			<c:when test="${room.dtype=='y'}">
	                                                 				${room.yrent}
	                                                 			</c:when>
	                                                 		</c:choose>
	                                                    </p>
	                                                    <p>주소 : ${room.addr} ${room.addsub}</p>
	                                                </div>
	                                                <div class="room_info3">
	                                                    <p>제목 : ${room.rcmt}</p>
	                                                </div>
	                                                <div class="room_info4">
	                                                    <p>종류 : 
	                                                    	<c:choose>
	                                                    		<c:when test="${room.rtype=='o'}">
	                                                    			원룸
	                                                    		</c:when>
	                                                    		<c:when test="${room.rtype=='o'}">
	                                                    			투룸
	                                                    		</c:when>
	                                                    	</c:choose>
	                                                    </p>
	                                                    <p>거래 유형 : 
	                                                    	<c:choose>
	                                                    		<c:when test="${room.dtype=='m'}">
	                                                    			월세
	                                                    		</c:when>
	                                                    		<c:when test="${room.dtype=='y'}">
	                                                    			전세
	                                                    		</c:when>
	                                                    	</c:choose>
	                                                    </p>
	                                                    <p>건물 유형 : 
	                                                    	<c:choose>
	                                                    		<c:when test="${room.btype=='s'}">
	                                                    			단독주택
	                                                    		</c:when>
	                                                    		<c:when test="${room.btype=='m'}">
	                                                    			다세대주택
	                                                    		</c:when>
	                                                    		<c:when test="${room.btype=='o'}">
	                                                    			오피스텔
	                                                    		</c:when>
	                                                    	</c:choose>
	                                                    </p>
	                                                </div>
	                                                <div class="room_info5">
	                                                    <p>찜 : 00회 </p>
	                                                    <p>조회수 : 000회</p>
	                                                </div>     
	                                                <div><a href="" class="btn_more"><span>상세보기</span></a></div>
	                                                <div><a href="" class="btn_modify">수정</a></div>
	                                                <div><a href="" class="btn_delete">삭제</a></div>
	                                            </div><!--.item_container-->
	                                        </div><!--.deal_item-->
	                                    </a>
	                                </li>
                                </c:forEach>
                            </ul>
                        </div> <!--.deal_list-->

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
                </div><!-- .deal_content .list_content_deal -->
            </div><!-- .sp_container -->
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
        </section><!-- #myDeal -->

<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/myDeal.js"></script>

<%@include file="./includes/footer.jsp" %>