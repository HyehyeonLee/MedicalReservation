<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 main 페이지</title>
<style>
.search_div {
	background-color: #B0E0EA;
	height: 200px;
	padding-top: 50px;
}

#search_form {
	width: 80%;
	margin: 0 auto;
}

table {
	margin-top: 10px;
	margin-left: 310px;
	width: 560px;
	text-align: center;
	background-color: #f5fbff;
}

td {
	border: 1px solid #f5fbff;
	border-collapse: collapse;
	padding: 7px;
}

#search_option {
	width: 20%;
}

#keyword {
	width: 70%;
}

.index-content{
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	display: inline-block;
	margin-bottom: 220px;
	margin-top: 130px;
}
#consult{
	float: right;
    position: relative;
    right: 70px;
    top: 283px;
	cursor:pointer;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/Chart.js"></script>
</head>

<body>
	<%
		String pwchange = (String) request.getAttribute("pwchange");
	String pwnotequal = (String) request.getAttribute("pwnotequal");
	String addresschange = (String) request.getAttribute("addresschange");
	String phonechange = (String) request.getAttribute("phonechange");
	String emailchange = (String) request.getAttribute("emailchange");

	if ("pwchange".equals((String) request.getAttribute("mode"))) {
	%>
	<script>alert("정보가 수정되었습니다!");</script>
	<%
		} else if ("pwnotequal".equals((String) request.getAttribute("mode"))) {
	%>
	<script>alert("비밀번호가 일치하지않습니다! 다시해주세요!");</script>
	<%
		} else if ("addresschange".equals((String) request.getAttribute("mode"))) {
	%>
	<script>alert("정보가 변경되었습니다!");</script>
	<%
		} else if ("phonechange".equals((String) request.getAttribute("mode"))) {
	%>
	<script>alert("정보가 변경되었습니다!")</script>
	<%
		} else if ("emailchange".equals((String) request.getAttribute("mode"))) {
	%>
	<script>alert("정보가 변경되었습니다!")</script>
	<%
		}
	%>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	
<div class="index-content">

		<div class="search_div">
			<form action="./search/filter" method="get" id="search_form"
				class="form-inline">
				<select name="spclAdmTyCd" class="form-control" id="search_option">
					<option value="all">전체</option>
					<option value="A0">국민안심병원</option>
					<option value="97">코로나검사 실시기관</option>
					<option value="99">코로나 선별진료소 운영기관</option>
				</select>&nbsp;&nbsp; <input type="text" name="keyword" id="keyword"
					class="form-control" placeholder="지역명을 입력해주세요" />&nbsp;&nbsp; <input
					type="submit" value="검색" class="btn btn-primary" />
			</form>
			<div class="chat-doot">
			<svg width="50px" height="50px" float="right" viewBox="0 0 16 16" id="consult" onclick="nwindow();" class="bi bi-chat-dots-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		 		<path fill-rule="evenodd" d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
			</svg>
			</div>
		</div>

		<table style="margin: 10px auto 0;">
			<c:forEach var="item2" items="${list2 }">
				<tr>
					<td style="border-right: inset;">누적 확진자 수<br />${item2.decideCnt}</td>
					<td style="border-right: inset;">격리해제 수<br />${item2.clearCnt}</td>
					<td>사망자 수<br />${item2.deathCnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<div>
				<canvas id="canvas" width="800px" height="200px"
					style="display: block; margin: 0 auto;"></canvas>
			</div>
		</div>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	

</body>
<c:choose>
	<c:when test="${empty dto.id}">
	<script>
	$(document).on('click','#consult',function(){
		alert("로그인이 필요한 서비스입니다. 로그인 후 이용 부탁드립니다.");
	});
	</script>
	</c:when>
	<c:otherwise>
		<script>
		$(document).on('click','#consult',function(){
		window.open('/www/consultCustomer','window','width=500,height=400');
	}); 
		</script>
	</c:otherwise>
</c:choose>
<script>
$(function(){
   
var chartLabels = [];
var chartData1 = [];



//현재 시간
var today = new Date();	
var hh= today.getHours();
var mi = today.getMinutes();
var ss = today.getSeconds();
//현재 날짜
var currentDay = new Date();
var Year = currentDay.getFullYear();
var Month = currentDay.getMonth();
var theDate = currentDay.getDate();
var dayOfWeek = currentDay.getDay();
var thisWeek = [];
//5일 간격으로 날짜 출력
for(var i=0; i<5; i++){
	var resultDay = new Date(Year, Month, theDate +(i - 4));
	var yy = resultDay.getFullYear();
	var mm  = Number(resultDay.getMonth()) + 1;
	var dd = resultDay.getDate();

	mm = String(mm).length === 1 ? '0' + mm : mm;
	dd = String(dd).length === 1 ? '0' + dd : dd;
}
	<c:forEach var="item" items="${list }" varStatus="status">
      chartData1.push(${item.decideCnt});
      thisWeek[${status.index}] = '${item.stateDt}';
    </c:forEach>

    var todayCnt = chartData1[chartData1.length-1] - chartData1[chartData1.length-2];
    alert(todayCnt)
var todayCnt = [];  
       
    
var lineChartData = {
   labels : thisWeek,
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
   console.log(thisWeek);
	
   var timer = setInterval(function(){
   	console.log(today);
    },7.56e+7) //21시간
});      
</script>

</html>
