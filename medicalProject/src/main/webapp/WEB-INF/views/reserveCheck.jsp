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
	.table{
		border:1px solid black;
		width : 50px;
	}
</style>
</head>
<body>
	 <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<table class="table">
		
			<c:forEach var="list" items="${reserveDto }">
				<tr>
					<%-- <td>${list.id }</td><br/> --%>
					<td>${list.name }</td>
					<td>${list.date }</td>
					<td>${list.time }</td>
				</tr>	
			</c:forEach>
		</table>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	</body>
</html>