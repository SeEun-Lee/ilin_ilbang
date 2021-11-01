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
            width: 300px;
        }
        #get_num{
            padding: 17px 27px;
            float: right;
        }
        .sub{
            padding: 20px 190px;
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
                    <label>이름<br>
                        <input type="text" id="username" size="61"
                        required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="email" size="61"
                        required>
                    </label>
                    <button type="button" id="get_num">인증번호 받기</button>
                </li>
                <li>                    
                    <label>
                        <input type="text" id="write_num" size="61"
                        placeholder="인증번호를 입력하세요" required>
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