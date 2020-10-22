<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty find_id}">
	<script>
		alert('아이디 : ${find_id}');
	</script>
</c:if>
	<form action="${pageContext.request.contextPath}/idSearchAction" method="POST">
		<label for="name">이름 : </label><input type="text" name="name" id = "name" placeholder="Ex)홍길동"/><br/>
		<label for="email">이메일 : </label><input type="text" name="email" id = "email" placeholder="Ex)aa@gmail.com"/><br/>
		<input type="submit" value="아이디찾기" />
		<!-- <button type="submit" onclick="idSearch_click();">아이디 찾기</button>  -->
	</form>
</body>
</html>