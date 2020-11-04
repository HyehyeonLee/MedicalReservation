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
}

ul{
	list-style: none;
}
</style>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
	
		<h1>구호 물품 신청</h1>
		<form action="/">
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
			<%-- <table class="table" id="supplyList">
				<tr>
					<td><img src="${pageContext.request.contextPath }/resources/img/rice.jpg" alt="" />
					${pageContext.request.contextPath }/resources/img/spam.jpg
						<label><input type="checkbox" name="rice" id="rice" />&nbsp;&nbsp;즉석 밥</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/shin.jpg" alt="" />
						<label><input type="checkbox" name="shin" id="shin" />&nbsp;&nbsp;컵라면</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/spam.jpg" alt="" />
						<label><input type="checkbox" name="spam" id="spam" />&nbsp;&nbsp;햄 통조림</label>
					</td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath }/resources/img/ramen.jpg" alt="" />
						<label><input type="checkbox" name="ramen" id="ramen" />&nbsp;&nbsp;봉지 라면</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/3min.jpg" alt="" />
						<label><input type="checkbox" name="3min" id="3min" />&nbsp;&nbsp;3분 요리</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/tuna.jpg" alt="" />
						<label><input type="checkbox" name="tuna" id="tuna" />&nbsp;&nbsp;참치 통조림</label>
					</td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath }/resources/img/water.jpg" alt="" />
						<label><input type="checkbox" name="water" id="water" />&nbsp;&nbsp;생수 500ml</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/mask.jpg" alt="" />
						<label><input type="checkbox" name="mask" id="mask" />&nbsp;&nbsp;일회용 마스크</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/hand.jpg" alt="" />
						<label><input type="checkbox" name="hand" id="hand" />&nbsp;&nbsp;손 소독제</label>
					</td>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath }/resources/img/coloring.jpg" alt="" />
						<label><input type="radio" name="hobby" id="coloring" />&nbsp;&nbsp;색칠 공부</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/radish.jpg" alt="" />
						<label><input type="radio" name="hobby" id="radish" />&nbsp;&nbsp;무순 키우기</label>
					</td>
					<td><img src="${pageContext.request.contextPath }/resources/img/shrimp.jpg" alt="" />
						<label><input type="radio" name="hobby" id="shrimp" />&nbsp;&nbsp;새우 키우기</label>
					</td>
				</tr>
			</table> --%>
			<input type="submit" value="다음" class="btn btn-primary"
				style="float: right; margin-top: -50px;" />
		</form>
		<br /> <br />
		
	</div>
	<%-- <div style="margin-top: 700px;">
	<%@ include file="./footer.jsp"%>
	</div> --%>
</body>

</html>