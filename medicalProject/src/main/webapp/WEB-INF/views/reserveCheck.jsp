<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file = "./include_file.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	 <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<c:forEach var="list" items="${reserveDto }">
			${list.id }<br/>
			${list.name }<br/>
			${list.date }<br/>
			${list.time }<br/>
		</c:forEach>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	</body>
</html>