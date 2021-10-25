<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>


<body>
    <header id="header">
    </header><!-- #header -->
    <section id="sub_page1">
        <div class="sp1_in">
            <div class="sp1_title">
                <h2 class="sp1_t">관심 목록</h2>
            </div><!-- sp1_title -->
            <div class="page1">
                <div class="sp1_menu">
                    <ul>
                        <li class="sm_title1, on"><a href="#">최근 본 방</a></li>
                        <li class="sm_title2"><a href="#">찜한 방</a></li>
                    </ul>
                </div><!-- .sp1_menu -->
                <div class="p1_like"><!-- 내용 -->
   
                </div>
                <div class="sp1_btns">
                    <button class="sp1_prve">이전으로</button>
                    <button class="sp1_next">다음으로</button>
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
                    <button class="sp1_prve">이전으로</button>
                    <button class="sp1_next">다음으로</button>
                </div>
            </div><!-- .page2 -->
        </div><!-- .sub_page1_in -->
    </section><!-- #sub_page1 -->
</body>

<%@include file="./includes/footer.jsp" %>