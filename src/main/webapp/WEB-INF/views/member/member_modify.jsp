<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원정보수정</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }        
        .h_logo a{
	    display: block;
	    background-image: url(../resources/img/h_logo.png);
	    background-size: 100% 100%;
	    background-repeat: no-repeat;
	    width: 80px;
	    height: 80px;
	    text-indent: -99999px;
	    overflow: hidden;
	    margin: 0 auto;
		}
        div{
            width: 460px;
            margin: 30px auto;
        }
        body{
            background-color: #f5f5f5;
        }
        .logo img{
            display: block;
            width: 100px;
            height: auto;
            margin: 0 auto;
        }
        form li{
            list-style: none;
            margin: 15px 0;
        }
        input, select{
            height: 50px;
        }
        select#month{
            width: 54px;
            height: 54px;
        }
        label{
            line-height: 30px;
        }
        #address{
            width: 325px;
        }
        button{
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: block;
            background-color: #222;
            border: 0px solid #222;
        }
        #btn_secu, #btn_addr{
            padding: 17px 30px;
            float: right;
        }
        .btn{
            display: flex;
            justify-content: space-between;
        }
        label{
            font-size: 15px;
            font-weight: bold;
        }
        #new_id[placeholder]{
            text-align: right;
        }
        #sex{
            padding: 0 30px 0 10px;
        }
        .input_box, #secu_sub, #addr_detail, #tel{
            width: 455px;
        }
        #email{
            width: 295px;
        }
        .sub, .quit{
            padding: 20px 83px;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <h1 class="h_logo"><a href="index.jsp">1인1방</a></h1>
        <form action="jdbc:log4jdbc:mysql://127.0.0.1:3306/oneroom?serverTimezone=Asia/Seoul" method="post">
            <ul>
                <li>
                    <label>아이디<br>
                        <input type="text" id="new_id" size="61" class="input_box"
                        disabled>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="new_pw" size="61" class="input_box"
                        required>
                    </label>
                </li>
                <li>
                    <label>비밀번호 확인<br>
                        <input type="password" id="new_ppw" size="61" class="input_box"
                        required>
                    </label>
                </li>
                <li>
                    <label>이름<br>
                        <input type="text" id="user_name" size="61" class="input_box"
                        required>
                    </label>
                </li>
                <li>
                    <label>생년월일<br>
                        <input type="text" id="year" size="12"
                        placeholder=" 년(4자)" required>
                    </label>
                    <select id="month">
                        <option value="0">월</option>
                        <option value="1">1월</option>
                        <option value="2">2월</option>
                        <option value="3">3월</option>
                        <option value="4">4월</option>
                        <option value="5">5월</option>
                        <option value="6">6월</option>
                        <option value="7">7월</option>
                        <option value="8">8월</option>
                        <option value="9">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="text" id="day" size="2"
                    placeholder=" 일" required>
                </li>
                <li>
                    <label>성별<br>
                        <select id="sex">
                            <option value="select" disabled>성별</option>
                            <option value="male">남자</option>
                            <option value="female">여자</option>
                        </select>
                    </label>
                </li>
                <li>
                    <label>주소<br>
                        <input type="text" id="address" size="61"
                        required>
                    </label>
                    <button type="button" id="btn_addr">주소 찾기</button>
                    <label>상세주소<br>
                        <input type="text" id="addr_detail" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <label>휴대전화번호<br>
                        <input type="tel" id="tel" size="32"
                        placeholder=" 전화번호 입력"
                        required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="email" size="15"
                        placeholder="이메일을 입력하세요">
                    </label>
                    <button type="button" id="btn_secu">인증코드 받기</button>
                </li>
                <li>
                    <input type="text" id="secu_sub" size="61"
                    placeholder=" 인증번호를 입력하세요" required>
                </li>
                <li class="btn">
                    <button type="submit" class="sub">수정완료</button>
                    <button type="submit" class="quit">회원탈퇴</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>