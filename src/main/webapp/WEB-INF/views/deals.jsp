<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="./includes/header.jsp" %>

        <section id="sub_page1">
        <div class="sp1_in">
            <div class="sp1_title">
                <h2 class="sp1_t">거래 관리</h2>
            </div><!-- sp1_title -->
            <div class="page1">
                <div class="sp1_menu">
                    <ul>
                        <li class="sm_title1, on"><a href="#">내 방 관리</a></li>
                        <li class="sm_title2"><a href="#">방 거래하기</a></li>
                    </ul>
                </div><!-- .sp1_menu -->
                <div class="sp1_info">
                    <p>일반 회원은 매물을 등록할 수 없습니다. 공인중개사 회원가입 후 매물을 등록해주세요.</p>
                    <p>진행중 : 등록 후 바로 거래가 가능합니다. </p>
                    <p>거래 완료 : 등록 한 매물이 거래 완료된 상태입니다. </p>
                    <p>검수 반려 : 운영원칙 위배 또는 신고로 비 공개된 상태입니다. </p>
                </div>
                <div><!-- 내용 -->
                    <ul>
                        <li></li>
                    </ul>
                </div>
                <div class="sp1_btns">
                    <button class="sp1_prve"><a href="#">이전으로</a></button>
                    <button class="sp1_next"><a href="#">다음으로</a></button>
                </div>
            </div><!-- .page1 -->
            <div class="page2">
                <div class="sp1_menu">
                    <ul>
                        <li class="sm_title1"><a href="#">최근 본 방</a></li>
                        <li class="sm_title2, on"><a href="#">찜한 방</a></li>
                    </ul>
                </div><!-- .sp1_menu -->
                <div><!-- 내용 -->
                    <ul>
                        <li></li>
                    </ul>
                </div>
                <div class="sp1_btns">
                    <button class="sp1_prve"><a href="#">이전으로</a></button>
                    <button class="sp1_next"><a href="#">다음으로</a></button>
                </div>
            </div><!-- .page2 -->
        </div><!-- .sub_page1_in -->
    </section><!-- #sub_page1 -->
    

<%@include file="./includes/footer.jsp" %>