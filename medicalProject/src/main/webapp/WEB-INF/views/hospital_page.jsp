<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기관 회원 페이지</title>
</head>
<body>
<h1>기관 회원 페이지</h1>
<div class="header">
	<%@ include file="./header.jsp"%>
</div>
<div class="content">
	<ul>
		<li><a href="${pageContext.request.contextPath }/reserve/admin?id=${dto.id}" target="_blank">예약 정보 조회</a></li>
		<li><a href="${pageContext.request.contextPath }/reserve/InsertReserveInfo" target="_blank">예약 정보 등록</a></li>
	</ul>		
</div>
<div class="footer">
	<%@ include file="./footer.jsp"%>
</div>
</body>
</html>