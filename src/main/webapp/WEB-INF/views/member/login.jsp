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
        .find, .join{
            padding: 20px 76px;
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
                        <input type="text" id="id" size="61"
                        required>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="pw" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="sub">로그인</button>
                </li>
                <li class="btn">
                    <a href=find_id.jsp class="find"> ID / PW 찾기 </a>
                    <a href=member_join.jsp class="join"> 회원가입 </a>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>