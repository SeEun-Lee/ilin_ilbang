<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .mail_input{
            width: 455px;
        }
        .mail_check_button button{
            font-size: 15px;
            cursor: pointer;
            color: white;
            display: block;
            background-color: #1F4E5F;
            border: 0px solid #1F4E5F;
            padding: 20px 182px;
        }
    </style>
</head>
<body>
    <div class="join_in">
        <div class="h_logo">
        	<h1><a href="index.jsp">1인1방</a></h1>
        </div>
        <form action="find_pw" method="post">
            <ul>
                <li>                    
                    <label>아이디<br>
                        <input type="text" id="mid" size="61" name="mid" required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" id="memail" class="mail_input" size="61"  name="memail"required>
                    </label>
                </li>
                <li>
                	<c:if test="${mpw!=null}">
                    	<label>당신의 비밀번호는 : ${mpw.mpw}<br></label>
                    </c:if>
                </li>
                <li class="mail_check_button">
                    <button type="submit">비밀번호 찾기</button>
                </li>

            </ul>
        </form>
    </div>
        
    <script type="text/javascript">
    /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){
    	var email = $(".mail_input").val();		// 입력한 이메일
    	
    	$.ajax()({
    		type:"GET",
    		url:"mailCheck?email=" + email
    	});
    });
    </script>
</body>
</html>