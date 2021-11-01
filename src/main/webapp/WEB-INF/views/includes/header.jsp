<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!--jQuery 연결-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!--jQuery UI 연결-->
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- 카카오 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6dfe001c629e5c1942f7fb1c1c822003&libraries=services"></script>
    <!-- css -->
    <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/roomList.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/roomLike.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/roomInfo_2.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="/resources/css/room_register.css">
    <link rel="stylesheet" href="/resources/css/button.css">
    <link rel="stylesheet" href="/resources/css/upload.css">
    <!-- api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c37e1a519b03d653d9f91c2b12ed7a87"></script>
    <script src="../resources/js/upload.js"></script>
    
    <title>1인1방</title>
</head>
<body>
    
    <div id="wrap">
        <header id="header">
            <div class="h_content">
                <div class="h_inner">
                        <h1 class="h_logo"><a href="/list">1인1방</a></h1>
                        <nav id="nav">
                            <ul class="gnb">
                                <li>
                                    <a href="/list" class="list active"><span>방 검색</span></a>
                                </li>
                                <li>
                                    <a href="/roomLike" class="roomLike"><span>관심목록</span></a>
                                </li>
                                <li>
                                    <a href="/sub/room_register" class="room_register"><span>방 내놓기</span></a>
                                </li>
                                <li>
                                    <a href=""><span>거래관리</span></a>
                                </li>
                                <li>
                                    <a href=""><span>허위매물 신고</span></a>
                                </li>
                            </ul>
                        </nav>
                        <div class="h_util">
                            <a href=""><span class="signin">로그인</span></a>
                            <a href=""><span class="signup">회원가입</span></a>
                        </div>
                </div><!--.h_inner-->
            </div><!--.h_content-->
        </header>