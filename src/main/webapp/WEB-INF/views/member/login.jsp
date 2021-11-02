<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>로그인</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            text-decoration: none;
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
        button, .btn1, .find{
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
        .sub{
            padding: 20px 207px;
        }
        #new_id[placeholder]{
            text-align: right;
        }
        .btn{
            display: flex;
            justify-content: space-between;
        }
        .join{
        	display: block;
            padding: 20px 50px;
        }
        .find{
        	display: block;
        	padding: 20px 30px;
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
                        <input type="text" id="mid" size="61"
                        required>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="mpw" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="sub">로그인</button>
                </li>
                <li class="btn">
                    <a href="/member/find_id"> <span class="find"> 아이디 찾기 </span></a>
                    <a href="/member/find_pw"> <span class="find"> 비밀번호 찾기 </span></a>
                    <a href="/member/member_join" class=btn1> <span class="join"> 회원가입 </span></a>
                </li>
            </ul>
        </form>
    </div>
</body>

</html>