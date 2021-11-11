<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@include file="./includes/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    
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
	                                    </li>
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
				<%@include file="./roomList.jsp" %>
				</div><!-- .inner -->
			</section><!-- .main_list -->
            
        </div><!--.main-container-->

        
<%@include file="./includes/footer.jsp" %>