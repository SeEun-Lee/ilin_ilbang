<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>아이디 찾기</title>
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
        form li{
            list-style: none;
            margin: 15px 0;
        }
        label{
            line-height: 30px;
            font-size: 15px;
            font-weight: bold;
        }
        input, select{
            height: 50px;
            width: 99%;
        }
        button{
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: block;
            background-color: #222;
            border: 0px solid #222;
        }
        #new_id[placeholder]{
            text-align: right;
        }
        .sub{
            padding: 20px 190px;
        }
        .text1{
        	display: block;
        	text-align: center;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <h1 class="h_logo"><a href="index.jsp">1인1방</a></h1>
        <form action="jdbc:log4jdbc:mysql://127.0.0.1:3306/oneroom?serverTimezone=Asia/Seoul" method="post">
            <ul>
                <li>
                	<p class="text1">
                		<br>
                		아이디 찾기
                		<br><br>
                		가입한 이름과 이메일정보를 입력해주세요
                	</p>
                </li>
                <li>                    
                    <label>이름<br>
                        <input type="text" id="mname" size="61"
                        placeholder="이름을 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="memail" size="61"
                        placeholder="이메일을 입력하세요" required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="sub">아이디 찾기</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>