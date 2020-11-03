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
	.inform{
		width : 80%;
		padding : 50px;
		margin : 0 auto;
	}

	table.table{
		border:1px solid black;
		width : 50px;
		margin-left:260px;
		box-shadow: 5px 5px 10px 0 #7f7f7f;
	}
	.table{
		display:inline;
		border-radius:5px;
		padding:60px;
	}
	
	
</style>
</head>
<body>
	 <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content" >
		
		<table class="table">
			<tr>
			<h1 style="margin-bottom:80px;">예약현황</h1>
			</tr>
		<c:choose>
			<c:when test = "${empty reserveDto }">
			<div class = "inform">
				<p class = "">예약 결과가 없습니다.</p>			
			</div>
			</c:when>		
			<c:otherwise>
				<c:forEach var="list" items="${reserveDto }">
					<tr>
						<td>${list.name }</td>
						<td>${list.date }</td>
						<td>${list.time }</td>
						<td>
						
					<a href="${pageContext.request.contextPath }/reserve/deleteAc?guest_reserve_id=${list.guest_reserve_id}">
					<svg width="10px" height="10px" viewBox="0 0 16 16" class="bi bi-check-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
	  <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
	  </svg><br />
					취소</a></td>	
				</c:forEach>
		</table>
		
		<!--예약결과가 null일 경우  -->
	
	</c:otherwise>
	</c:choose>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	</body>
</html>