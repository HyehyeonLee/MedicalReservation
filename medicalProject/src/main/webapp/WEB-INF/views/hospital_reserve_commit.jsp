<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 입력</title>
</head>
<body>
<div class="header">
	<%@ include file = "./header.jsp" %>
</div>
<div class = "content">
	<h1 class="sub-title">예약 정보가 등록되었습니다.</h1>
	<p class="sub-title" style = "padding : 5;">&nbsp;&nbsp;${reserveDto.date }</p>
	<p class="sub-title"  style = "padding : 5;">&nbsp;&nbsp;${reserveDto.time }</p>
	<br />
	<input type="button" value="이전으로" onclick="history.go(-1);" class="btn btn-success"/>
</div>
<div class="footer">
	<%@ include file = "./footer.jsp" %>
</div>
</body>
</html>