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
            background-color: #222;
            border: 0px solid #222;
        }
        #mgender{
            padding: 0 20px 0 20px;
        }
        #btn_code{
            padding: 17px 30px;
            float: right;
        }
        .input_box{
            width: 455px;
        }
        #memail{
            width: 295px;
        }
        .submit{
            padding: 20px 200px;
        }

    </style>
</head>
<body>
    <div class="join_in">
        <h1 class="h_logo"><a href="index.jsp">1인1방</a></h1>
        <form action="join_action.jsp" method="post">
            <ul>
                <li>
                    <label>아이디<br>
                        <input type="text" id="mid" name="mid" size="61" class="input_box"
                        placeholder=" 아이디를 입력하세요" required>
                    </label>
                </li>
                <li>                    
                    <label>비밀번호<br>
                        <input type="password" id="mpw" name="mpw" size="61" class="input_box"
                        placeholder=" 비밀번호를 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>비밀번호 확인<br>
                        <input type="password" id="mppw" name="mppw" size="61" class="input_box"
                        placeholder=" 비밀번호를 다시 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>이름<br>
                        <input type="text" id="mname" name="mname" size="61" class="input_box"
                        placeholder=" 이름을 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>생년월일<br>
                        <input type="text" id="mbirth" name="mbirth" size="12" class="input_box"
                        placeholder="생년월일(6자리)" required>
                    </label>
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
                        <input type="text" id="maddr" name="maddr" class="input-box" size="61"
                        placeholder=" 주소를 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>휴대전화번호<br>
                        <input type="tel" id="tel" name="tel" size="32" class="input_box"
                        placeholder=" 전화번호를 입력하세요" >
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="memail" name="memail" size="15"
                        placeholder=" 이메일을 입력하세요" required>
                    </label>
                    <button type="button" id="btn_code">인증코드 받기</button>
                </li>
                <li>
                    <input type="text" id="code_sub" size="61" class="input_box"
                    placeholder=" 인증번호를 입력하세요" >
                </li>
                <li>
                    <button type="submit" class="submit">가입완료</button>
                </li>
            </ul>
        </form>
    </div>
</body>
</html>