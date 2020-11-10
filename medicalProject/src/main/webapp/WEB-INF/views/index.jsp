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
    top: 254px;
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
			<c:forEach var="item2" items="${list2 }">	<!-- 현재 당일 날짜 정보만 출력(누적확진자,격리해제,사망자) -->
				<tr>
					<td style="border-right: inset;">누적 확진자 수<br />
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-line" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2zm1 12h2V2h-2v12zm-3 0V7H7v7h2zm-5 0v-3H2v3h2z"/>
</svg>
					${item2.decideCnt}</td>
					<td style="border-right: inset;">격리해제 수<br />
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hand-thumbs-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16v-1c.563 0 .901-.272 1.066-.56a.865.865 0 0 0 .121-.416c0-.12-.035-.165-.04-.17l-.354-.354.353-.354c.202-.201.407-.511.505-.804.104-.312.043-.441-.005-.488l-.353-.354.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315L12.793 9l.353-.354c.353-.352.373-.713.267-1.02-.122-.35-.396-.593-.571-.652-.653-.217-1.447-.224-2.11-.164a8.907 8.907 0 0 0-1.094.171l-.014.003-.003.001a.5.5 0 0 1-.595-.643 8.34 8.34 0 0 0 .145-4.726c-.03-.111-.128-.215-.288-.255l-.262-.065c-.306-.077-.642.156-.667.518-.075 1.082-.239 2.15-.482 2.85-.174.502-.603 1.268-1.238 1.977-.637.712-1.519 1.41-2.614 1.708-.394.108-.62.396-.62.65v4.002c0 .26.22.515.553.55 1.293.137 1.936.53 2.491.868l.04.025c.27.164.495.296.776.393.277.095.63.163 1.14.163h3.5v1H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
</svg>
					${item2.clearCnt}</td>
					<td>사망자 수<br />
					<svg width="1.0625em" height="1em" viewBox="0 0 17 16" class="bi bi-exclamation-triangle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M7.938 2.016a.146.146 0 0 0-.054.057L1.027 13.74a.176.176 0 0 0-.002.183c.016.03.037.05.054.06.015.01.034.017.066.017h13.713a.12.12 0 0 0 .066-.017.163.163 0 0 0 .055-.06.176.176 0 0 0-.003-.183L8.12 2.073a.146.146 0 0 0-.054-.057A.13.13 0 0 0 8.002 2a.13.13 0 0 0-.064.016zm1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566z"/>
  <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995z"/>
</svg>
					${item2.deathCnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<div>
				<canvas id="canvas" width="800px" height="200px"
					style="display: block; margin: 0 auto;"></canvas>
			</div>
		</div>
	<div class="slideDiv" style = "width : 60%; margin : 0 auto; padding-top : 50px; margin-top : 50px; border-top : 1px solid #b8b8b8;">
		<%@include file = "./slider.jsp" %>
	</div>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	

</body>


<% if( request.getAttribute("messageSend") != null) { %>
<%if( ((String)(request.getAttribute("messageSend"))).equals("successSend")){ %>
		 	<script>alert("메일이 성공적으로 전송되었습니다.");</script>
		 <%} %>
<% } %>
<script>

//상담버튼 따라다니게 하는 제이쿼리
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#consult").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값  );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#consult").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});

$(function(){
   
var chartLabels = [];	
var chartData1 = [];	//누적 확진자 수가 담아져 있음
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
var thisWeek = [];		//현재 날짜정보를 thisWeek에 담아줌
//8일 간격으로 날짜 출력
for(var i=0; i<8; i++){
	var resultDay = new Date(Year, Month, theDate +(i - 7));
	var yy = resultDay.getFullYear();
	var mm  = Number(resultDay.getMonth()) + 1;		//Month를 쓸때는 +1을  해줘야 한다고 함
	var dd = resultDay.getDate();

	mm = String(mm).length === 1 ? '0' + mm : mm;
	dd = String(dd).length === 1 ? '0' + dd : dd;
}

//전 누적확진자수 나오게 한 코드 -> 한 날 한 날 뿌려주는 코드
	//<c:forEach var="item" items="${list }" varStatus="status">
//      chartData1.push(${item.decideCnt});
//	    var todayCnt = chartData1[chartData1.length-1] - chartData1[chartData1.length-2];
//    </c:forEach>

	//1~8까지 반복
	thisWeek[0] = '${list[0].stateDt}';
	<c:forEach var="cnt" begin="1" end="8">
			chartData1.push(${list[cnt].decideCnt} - ${list[cnt-1].decideCnt});		//누적 확진자 수
	      thisWeek[${cnt}] = '${list[cnt].stateDt}';
	</c:forEach>
	chartData1.push(${list[9].decideCnt} - ${list[8].decideCnt});	//그래프에서 하루 빈 공간으로 뜨는거 잡은 코드
	
//어제부터 엊그제를 빼는 코드를 임의로 만든거임
    //var todayCnt = chartData1[chartData1.length-1] - chartData1[chartData1.length-2];
    //alert(todayCnt)
	//var todayCnt = [];  
       
//alert(thisWeek);
    
var lineChartData = {
   labels : thisWeek,					//그래프 밑에 날짜를 뿌려주는 곳
   datasets : [
         {   
            label : "확진자 수",
            backgroundColor:"rgba(230, 239, 245)",
            borderColor : "rgba(111, 143, 163)",
            pointBackgroundColor : "rgba(224, 34, 34)",
            pointBorderColor : "rgba(0.0.0)",
            data : chartData1								//누적 확진자수를 그래프로 보여줌
         }
         
      ]
   }
   
   function createChart(){
      var ctx = document.getElementById("canvas").getContext("2d");
      window.myLine = new Chart(ctx, { type:"line", data:lineChartData, 
          options: {			//y축 0부터 시작하는 코드
              responsive:false,
         	  scales: {
					yAxes: [{
						ticks:{
							beginAtZero:true,
							fontSize:10,
							}
						}]
          }
		
          } }); //바뀐 코드2.0버전
}                     
   
   createChart();
   console.log(thisWeek);
	
   var timer = setInterval(function(){	//21시간마다 업데이트 되는 코드
   	console.log(today);
    },7.56e+7) //21시간
});      
</script>

</html>
