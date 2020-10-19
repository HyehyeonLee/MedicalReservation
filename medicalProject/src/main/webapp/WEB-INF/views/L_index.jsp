<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 main 페이지</title>
<style>
	.search_div{
		background-color : #B0E0EA;
		height: 200px;
	}
	
	#search_form{
		width : 90%; 
		margin : 0 auto;
	}
</style>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<div class = "search_div">		
		<form action="./search/filter" method="get" id="search_form" class= "form-inline">
			<input type="radio" name="spclAdmTyCd" value="A0" class="form-control"/>국민안심병원&nbsp;&nbsp;
			<input type="radio" name="spclAdmTyCd" value="97" class="form-control"/>코로나검사 실시기관&nbsp;&nbsp;
			<input type="radio" name="spclAdmTyCd" value="99" class="form-control"/>코로나 선별진료소 운영기관&nbsp;&nbsp;
			<br />
			<input type="text" name="keyword" id="keyword" class="form-control" style = "width : 80%;" placeholder = "지역명을 입력해주세요"/> &nbsp;&nbsp;
			<input type="submit" value="검색" class = "btn btn-primary"/>
		</form>
	</div>
</body>
</html>