<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 신청</title>
<style type="text/css">
.item {
	width: 33%;
	display: inline-block;
	float: left;
}

img {
	width: 50%;
	margin-left:30px;
}

ul{
	list-style: none;
}

.sub-title {
	padding: 20px;
	color: #5c5c5c;
}
</style>
<script>
	$(function(){
			if($("input:checkbox").is(":checked") == true){
					alert("체크!");
				}
		})
</script>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<h2 class="sub-title">구호 물품 신청</h2>
		<br />
		<form action="${pageContext.request.contextPath }/supply/address" method="get">
		<input type="hidden" name="id" value="${dto.id }" />
			<div class="supply-wrap">
				<ul>
				<c:forEach var="supply" items="${supply }">
					<li>
						<div class = "item">
						<img src="${pageContext.request.contextPath }/resources/img/${supply.code}.jpg" />
						<br />
						<!--  <img src="${supply.img}" /> -->
						<label> <c:choose>
								<c:when test="${supply.plural == 1 }">
								<input type="checkbox" value="${supply.code }" />
								<c:out value="${supply.title }" />
								<br />
									<input type="text" name="" id="" value="${supply.price }" /><br />
									<input type="button" value="-" />
									<input type="text" value = "1" width = "20px"/>
									<input type="button" value="+" />
								</c:when>
								<c:when test="${supply.plural == 0 }">
									<input type="radio" name="hobby" value="${supply.code }" />
									<c:out value="${supply.title }" />
								</c:when>
							</c:choose> 
						</label> <br />
						</div>
					</li>
				</c:forEach>
					</ul>
			</div>
			<input type="submit" value="다음" class="btn btn-primary"
				style="float: right; margin-top: -50px;" />
		</form>
		<br /> <br />
	</div>
	
</body>

</html>