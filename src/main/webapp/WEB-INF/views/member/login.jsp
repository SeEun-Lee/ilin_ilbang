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
            background-color: #1F4E5F;
            border: 0px solid #1F4E5F;
        }
        .submit{
            padding: 20px 207px;
        }
        .btn-group{
            display: flex;
            justify-content: space-between;
        }
        .btn{
            font-size: 15px;
            cursor: pointer;
            color: white;
        	display: block;
            padding: 20px 35px;
            background-color: #1F4E5F;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <div class="h_logo">
        	<h1><a href="index.jsp">1인1방</a></h1>
        </div>
        <form action="login" method="post">
            <ul>
                <li>
                    <label>아이디<br>
                        <input type="text" id="mid" name="mid" maxlength="20" 
                        placeholder=" 아이디를 입력하세요" required>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="mpw" name="mpw" maxlength="20" 
                        placeholder=" 비밀번호를 입력하세요" required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="submit">로그인</button>
                </li>
                <li class="btn-group">
                    <a href="/member/find_id" class="btn"> 아이디 찾기 </a>
                    <a href="/member/find_pw" class="btn"> 비밀번호 찾기 </a>
                    <a href="/member/member_join" class="btn"> 회원가입 </a>
                </li>
            </ul>
        </form>
    </div>
</body>

</html>