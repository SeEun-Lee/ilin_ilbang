<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            padding: 20px 190px;
        }
    </style>
</head>
<body>
    <div class="mail_wrap">
        <div class="h_logo">
        	<h1><a href="index.jsp">1인1방</a></h1>
        </div>
        <form action="find_id" method="post" class=mail_wrap>
            <ul>
                <li>                    
                    <label>이름<br>
                        <input type="text" name="mname" id="mname" size="61"
                        placeholder=" 이름을 입력하세요" required>
                    </label>
                </li>
                <li>
                    <label>이메일<br>
                        <input type="email" name="memail" id="memail" size="61" class="mail_input"
                        placeholder=" 이메일을 입력하세요" required>
                    </label>
                </li>
                <li>
                	<c:if test="${mid!=null}">
                    	<label>당신의 아이디는 : ${mid.mid}<br></label>
                    </c:if>
                </li>
                <li>
                    <button type="submit" id="find_id_btn" class="submit">아이디 찾기</button>
                </li>
            </ul>
        </form>
    </div>
	
	
</body>
</html>