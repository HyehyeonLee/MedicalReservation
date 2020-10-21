<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" >
</head>
<body>
   <div class="wrap">
        <div class = "sub-menu">
            <ul>
                <li><a href="${pageContext.request.contextPath }/L_loginform">로그인</a></li>   
                <li><a href="${pageContext.request.contextPath }/L_joinform">회원가입</a></li>
            </ul>
        </div>
        
         <div class = "main-menu">
            <ul>
                <li style="position: relative; bottom: 10px;"><a href="#"><img src="image/logo3.PNG" width="120px" height="66px"></a></li>                <li><a href="#">지원</a></li>
                <li><a href="#">뉴스</a></li>
                <li><a href="#">상담</a></li>
            </ul>
        </div>
   </div>	   
</body>
</html>
