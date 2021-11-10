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
		
        form li{
            list-style: none;
            margin: 15px 0;
        }
        input, select{
            height: 50px;
        }
        label{
            line-height: 30px;
            font-size: 15px;
            font-weight: bold;
        }
        button{
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: block;
            background-color: #1F4E5F;
            border: 0px solid #1F4E5F;
        }
        .input_box{
            width: 455px;
        }
        .submit{
            padding: 20px 200px;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <div class="h_logo">
        	<h1><a href="index.jsp">1인1방</a></h1>
        </div>
        <form action="member_join" method="post">
            <ul>
                <li>
                    <label>아이디<br>
                        <input type="text" id="mid" name="mid" class="input_box" maxlength="20"
                        placeholder=" 아이디 입력"required>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="mpw" name="mpw" class="input_box" maxlength="20"
                        placeholder=" 비밀번호 입력"required>
                    </label>
                </li>
                <li>
                    <label>이름<br>
                        <input type="text" id="mname" name="mname" class="input_box" maxlength="10"
                        placeholder=" 이름 입력" required>
                    </label>
                </li>
                <li>
                    <label>생년월일<br>
                        <input type="text" id="mbirth" name="mbirth" class="input_box" size="6"
                        placeholder=" 생년월일 6자리" required>
                    </label>
                </li>
                <li>
                    <label>성별<br>
                        <select id="mgender" name="mgender">
                            <option value="select" disabled>성별</option>
                            <option value="male">남자</option>
                            <option value="female">여자</option>
                        </select>
                    </label>
                </li>
                <li>
                    <label>주소<br>
                        <input type="text" id="maddr" name="maddr" class="input_box"  maxlength="50"
                        placeholder=" 주소 입력" required>
                    </label>
                </li>
                <li>
                    <label>전화번호<br>
                        <input type="tel" id="mtel" name="mtel" class="input_box" maxlength="50"
                        placeholder=" 전화번호 입력" required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="memail" name="memail" class="input_box" maxlength="50"
                        placeholder="이메일을 입력하세요">
                    </label>
                </li>
                <li>
                    <button type="submit" class="submit">가입완료</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>