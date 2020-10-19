<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	table{
		margin-top:330px;
		margin-left:310px;
		width:560px;
		text-align:center;
		background-color:#f5fbff;
	}
	td{
		border:1px solid #f5fbff;
		border-collapse:collapse;
		padding:7px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/Chart.js"></script>
</head>

	<table>
		<c:forEach var="item2" items="${list2 }">
		<tr>
			<td style="border-right:inset;">확진자 수<br/>${item2.decideCnt}</td>
			<td style="border-right:inset;">격리해제 수<br/>${item2.clearCnt}</td>
			<td>사망자 수<br/>${item2.deathCnt}</td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<div>
			<canvas id="canvas" width="800px" height="200px" style="margin-left:200px;"></canvas>
		</div>
	</div>
	
<script>

$(function(){
	
var chartLabels = [];
var chartData1 = [];

	<c:forEach var="item" items="${list }">
		chartLabels.push(${item.stateDt});
		chartData1.push(${item.decideCnt});
	</c:forEach>

var lineChartData = {
	labels : chartLabels,
	datasets : [
			{	
				label : "확진자 수",
				backgroundColor:"rgba(230, 239, 245)",
				borderColor : "rgba(111, 143, 163)",
				pointBackgroundColor : "rgba(224, 34, 34)",
				pointBorderColor : "rgba(0.0.0)",
				data : chartData1
			}
		]
	}
	
	function createChart(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myLine = new Chart(ctx, { type:"line", data:lineChartData, options: {responsive:false} }); //바뀐 코드2.0버전
}							
	
	createChart();
	
});		
</script>

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