<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
    <meta name="viewport" content="width-device-width", initial-scale="1">
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
        .btn{
            padding: 20px 207px;
        }
        .btn-list{
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
        <form method="post" action="/member/login_action.jsp">
            <ul>
                <li class ="form-group">
                    <label>아이디<br>
                        <input type="text" id="mid" class="form-control" name="mid" maxlength="20"
                        placeholder="아이디" required>
                    </label>
                </li>
                <li class ="form-group">                    
                    <label>비밀번호<br>
                        <input type="password" id="mpw" class="form-control" name="mpw" maxlength="20"
                        placeholder="비밀번호" required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="btn btn-primary form-control">로그인</button>
                </li>
                <li class="btn-list">
                    <a href="/member/find_id"> <span class="find"> 아이디 찾기 </span></a>
                    <a href="/member/find_pw"> <span class="find"> 비밀번호 찾기 </span></a>
                    <a href="/member/member_join" class=btn1> <span class="join"> 회원가입 </span></a>
                </li>
            </ul>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>

</html>