<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a451e93a63b4d7a44c80b380b0b8713"></script>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<br />
	<table class = "table table-hover" style = "width : 80%; margin : 0 auto;">
	<tr>
		<th>번호</th>
		<th>주소</th>
		<th>기관명</th>
		<th>전화번호</th>
		<th>예약</th>
	</tr>
	<% int i = 1; %>
	
	<c:forEach var = "item" items = "${list }">
		<tr>
			<td><%=i++ %></td>
			<td><c:out value = "${item.addr }" /></td><!-- onclick="window.open(this.href, '', 'width=500, height=500'); return false;" -->
			<td><a href="https://map.kakao.com/link/search/${item.addr } ${item.yadmNm }" target="_blank"><c:out value = "${item.yadmNm }"/></a></td>
			<td><a href="tel:${item.telno }"><c:out value = "${item.telno }"/></a></td>
			<td><input type="button" id="reserveBtn" value="예약" class="btn btn-primary" /></td>
		</tr>
		</c:forEach>

</table>
</body>
</html>