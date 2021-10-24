<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <title>방 정보</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/roomInfo_style.css">
</head>
<body>
	<form action="register" method="post">
        <div class="room_info_in">
            <div class="ms_title">
                <h2 class="ms_t">
                   	 매물번호 <span>000 글제목</span>
                </h2>
                <p class="back"><a href="/">뒤로가기</a></p>
            </div><!-- ms_title -->
            <div class="ms_contant1">
                <div class="msc1_img">
                    <img src="../resources/img/room_info.png" alt="">
                    <div class="heart"><a href="#"></a></div>
                    <p class="msc1_img_text">서울특별시 동대문구</p>
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
               		<tr><td>보증금/월세 :</td><td><input type="text"></td><td>방종류 :</td><td><input type="text" name="rtype"></td></tr>
               		<tr><td>면적 :</td><td><input type="text" name="area"></td><td>층수 :</td><td><input type="text" name="flr"></td></tr>
               		<tr><td>입주가능일 :</td><td><input type="text" name="mvdate"></td><td>방향:</td><td><input type="text" name="rface"></td></tr>
               		<tr><td>주차 :</td><td><input type="text" name="park"></td><td>엘리베이터 :</td><td><input type="text" name="elev"></td></tr>
               		<tr><td>건물종류 :</td><td><input type="text" name="btype"></td></tr>
               	</table>
            </div><!-- ms_contant2 -->
            <div class="ms_contant3">
                <h2 class="ms3_title">룸 옵션</h2>
                <ul>
                    <li><p class="ms3_op">에어컨</li>
                    <li><p class="ms3_op">세탁기</li>
                    <li><p class="ms3_op">냉장고</li>
                    <li><p class="ms3_op">TV</li>
                    <li><p class="ms3_op">가스레인지</li>
                    <li><p class="ms3_op">전자레인지</li>
                    <li><p class="ms3_op">침대</li>
                    <li><p class="ms3_op">책상</li>
                    <li><p class="ms3_op">옷장</li>
                    <li><p class="ms3_op">신발장</li>
                </ul>
            </div><!-- ms_contant3 -->
            <div class="ms_contant4">
                <form action="">
                    <h2 class="ms4_title">담당자 코멘트</h2>
                    <div class="ms4_memo">
                        <textarea name="content" id="ucontent" placeholder="내용" required></textarea>
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
</body>
</html>