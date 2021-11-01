<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>회원가입</title>
    <style>
        *{
            margin: 0;
            padding: 0;
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
            width: 172px;
            height: 54px;
        }
        label{
            line-height: 30px;
        }
        button{
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: block;
            background-color: #1F4E5F;
            border: 0px solid #1F4E5F;
        }
        #btn_secu, #btn_addr{
            padding: 17px 30px;
            float: right;
        }
        label{
            font-size: 15px;
            font-weight: bold;
        }
        #new_id[placeholder]{
            text-align: right;
        }
        #sex{
            width: 460px;
        }
        #address{
            width: 325px;
        }
        #addr_detail,#tel, #secu_sub, .input_box{
            width: 455px;
        }
        #email{
            width: 295px;
        }
        .sub{
            padding: 20px 200px;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <p class="logo">
            <img src="./HatchfulExport-All/logo_transparent.png" alt="로고">
        </p>
        <form action="#" method="post">
            <ul>
                <li>
                    <label>아이디<br>
                        <input type="text" id="new_id" size="61" class="input_box"
                        required>
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
                    <label>중개사무소 이름<br>
                        <input type="text" id="office_name" size="61" class="input_box"
                        placeholder=" 중개사무소 이름 입력" required>
                    </label>
                </li>
                <li>
                    <label>대표자명<br>
                        <input type="text" id="ceo_name" size="61" class="input_box"
                        placeholder=" 대표자명 입력" required>
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
                    <label>전화번호<br>
                        <input type="tel" id="tel" size="32"
                        placeholder=" 전화번호를 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="email" size="15"
                        placeholder=" 이메일을 입력하세요">
                    </label>
                    <button type="button" id="btn_secu">인증코드 받기</button>
                </li>
                <li>
                    <input type="text" id="secu_sub" size="61"
                    placeholder=" 인증번호를 입력하세요" required>
                </li>
                <li>
                    <button type="submit" class="sub">가입완료</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>