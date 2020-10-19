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
	<div class = "sub-menu">
		<ul>
			<li><a href="./L_loginform">로그인</a></li>
			<li><a href="./J_joinform">회원가입</a></li>
		</ul>
	</div>
	<div class = "main-menu">
		<ul>
			<li><a href="#">지원</a></li>
			<li><a href="#">뉴스</a></li>
			<li><a href="#">상담</a></li>
		</ul>
	</div>
</body>
</html>