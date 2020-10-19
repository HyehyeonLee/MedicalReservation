<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 main 페이지</title>
</head>
<body>
<%@ include file="./header.jsp" %>
<h1>main</h1>
<h1>${pageContext.request.contextPath }</h1>
<button onclick="location.href='J_joinform'">회원가입</button>
<button onclick="location.href='L_loginform'">로그인</button>
</body>
</html>