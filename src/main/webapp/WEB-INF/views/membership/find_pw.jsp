<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>비밀번호 찾기</title>
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
        #new_id[placeholder]{
            text-align: right;
        }
        #email{
            width: 455px;
        }
        .sub{
            padding: 20px 165px;
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
                        <input type="text" id="user_id" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="email" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <button type="submit" class="sub">임시 비밀번호 받기</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>