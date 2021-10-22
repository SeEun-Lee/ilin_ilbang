<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <title>방 내놓기</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/sub02_style.css">
</head>
<body>
    <header id="header">
    </header><!-- #header -->
    <section id="sub_page2">
        <div class="sp2_in">
            <div class="sp2_title">
                <h2 class="sp2_t">방 내놓기</h2>
            </div><!-- sp2_title -->
            <div class="sp2_content1">
                <div class="sc1_text">
                    <p>★ 등록된 매물은 30일간 유지 됩니다</p>
                    <p>★ 등록 후 바로 거래가능 합니다</p>
                </div>
                <div class="sc1_box1">
                    <div class="sb1_l">
                        <p>종류선택</p>
                        <p>건설유형</p>
                    </div>
                    <div class="sb1_r">
                        <div class="sb1_r1">
                            <p class="point"><a href="#">원룸</a></p>
                            <p><a href="#">투룸</a></p>
                            <p><a href="#">아파트</a></p>
                            <p><a href="#">오피스텔</a></p>
                        </div>
                        <div class="sb1_r2">
                            <p class="point"><a href="#">단독주택</a></p>
                            <p><a href="#">아파트</a></p>
                            <p><a href="#">빌라</a></p>
                            <p><a href="#">상가</a></p>
                        </div>
                    </div>
                </div>
            </div><!-- .sp2_content1 -->
            <div class="sp2_content2">
                <h3 class="sc_title">위치정보</h3>
                <ul>
                    <li class="sc2_box1">주소 검색</li>
                    <li class="sc2_box2">
                        <div class="sb2_text">★ 도로명, 지역별, 건물명 등으로 검색이 가능하다.</div>
                        <button class="sb2_sec">주소검색</button>
                        <p><input type="text"></p>
                        <p class="sb2_memo">상세 주소 입력하세요</p>
                    </li>
                    <li class="sc2_box3">
                        <div class="img">지도</div>
                    </li>
                </ul>
            </div><!-- .sp2_content2 -->
            <div class="sp2_content3">
                <h3 class="sc_title">거래정보</h3>
                <div class="sc3_box"> 
                    <p class="sb3_t">거래 종류</p>
                    <ul>
                        <li class="sb3_choice on">월세</li>
                        <li class="sb3_memo">보증금/전세금 입력하세요</li>
                    </ul>
                    <ul>
                        <li class="sb3_choice">전세</li>
                        <li class="sb3_memo">월세를 입력하세요</li>
                    </ul>
                </div>
            </div><!-- .sp2_content3 -->
            <div class="sp2_content4">
                <h3 class="sc_title">기본정보</h3>
                <div class="sc4_info">
                    <div class="sc4_box1">
                        <p class="sb4_t">건물 크기</p>
                        <div class="sb4_r">
                            <form action="">
                                <label for="sc4"><span>공공면적</span><input type="text" name="sc4">평</label>
                                <label for="sc4"><input type="text" class="sc4">m2</label>
                            </form>
                            <form action="">
                                <label for="sc4"><span>건물면적</span><input type="text" name="sc4">평</label>
                                <label for="sc4"><input type="text" class="sc4">m2</label>
                            </form>
                        </div>
                    </div>
                    <div class="sc4_box2">
                        <p class="sb4_t">층수</p>
                        <div class="sb4_r">
                            <form action="">
                                <label for="building_select1">건물 층수</label>
                                <select id="building_select1">
                                    <option value="">건물 층수 선택</option>
                                    <option value="one">1층</option>
                                    <option value="two">2층</option>
                                </select>
                            </form>
                            <form action="">
                                <label for="building_select2">해당 층수</label>
                                <select id="building_select2">
                                    <option value="">해당 층수 선택</option>
                                    <option value="one">1층</option>
                                    <option value="two">2층</option>
                                </select>
                            </form>
                        </div>
                    </div>
                </div>
            </div><!-- .sp2_content4 -->
            <div class="sp2_content5">
                <h3 class="sc_title">추가정보</h3>
                <div class="sc5_box">
                    <div class="sb5_l">
                        <div class="sb5_l1">
                            <p class="sb5_t">관리비</p>
                            <ul>
                                <li><p class="point">O</p></li>
                                <li><p>X</p></li>
                            </ul>
                        </div>
                        <div class="sb5_l2">
                            <p class="sb5_t">반려동물</p>
                            <ul>
                                <li><p class="point">O</p></li>
                                <li><p>X</p></li>
                            </ul>
                        </div>
                    </div>
                    <div class="sb5_r">
                        <div class="sb5_r1">
                            <p class="sb5_t">발코니</p>
                            <ul>
                                <li><p class="point">O</p></li>
                                <li><p>X</p></li>
                            </ul>
                        </div>
                        <div class="sb5_r2">
                            <p class="sb5_t">베란다</p>
                            <ul>
                                <li><p class="point">O</p></li>
                                <li><p>X</p></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="sc5_op">
                    <p class="sb5_t">추가 옵션</p>
                    <ul>
                        <li><p class="point">에어컨</p></li>
                        <li><p>가스레인지</p></li>
                        <li><p>냉장고</p></li>
                        <li><p>TV</p></li>
                        <li><p>신발장</p></li>
                        <li><p>옷장</p></li>
                    </ul>
                </div>
            </div><!-- .sp2_content5 -->
            <div class="sp2_content6">
                <h3 class="sc_title">상세설명</h3>
                <div class="sc6_box">
                    <div class="sb6_l">
                        <p>제목</p>
                        <p>상세 설명</p>
                        <p>비공개 메모</p>
                    </div>
                    <div class="sb6_r">
                        <p><input type="text" placeholder=" 예) 롯데백화점 5분거리"></p>
                        <p><input type="text"></p>
                        <p><input type="text" placeholder=" 외부에는 보이지 않음"></p>
                    </div>
                </div>
            </div><!-- .sp2_content5 -->
            <div class="sp2_content7">
                <h3 class="sc_title">사진등록</h3>
                <div class="img_save"></div>
                <label for="check"><input type="checkbox" id="check">매물등록 규정을 확인 했으며, 등록한 정보는 실제와 다름이 없습니다.</label>
                <div class="sc7_btns">
                    <button>등록취소</button>
                    <button>등록하기</button>
                </div>
            </div><!-- .sp2_content5 -->
        </div><!-- .sp2_in -->
    </section><!-- #sub_page2 -->
</body>
</html>