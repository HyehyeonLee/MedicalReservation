<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 성공</h1>
	<h2>${loginId }님 환영합니다!</h2><br/>
	<form action="logout">
		<input type="submit" value="로그아웃"/>
	</form>
</body>
</html>