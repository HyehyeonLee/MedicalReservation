<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta http-equiv="refresh" content="URL=http://localhost:9096/www/reserve/admin">	<!--업그레이드 setTimeOut코드를 사용하기 위해 필요함
																						시간이 되면 자동으로 새로고침이 되면서 지정한 경로로 감-->

<title>예약 정보 현황</title>
<style>
	.float-left{
		float:left;
		margin:5px;
	}
</style>
</head>
<body>
	<div class="template">
		<textarea rows="10" cols="50" class="console" style="resize: none;" disabled="disabled"></textarea>
	</div>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	let log;
	function getGuestInfo(info){
		alert(info);
		$(".console").val(log + "(new) " + info + "\n");
	}
	
		var webSocket = new WebSocket("ws://192.168.4.147:9096/www/admin");
		webSocket.onopen = function(message){};
		webSocket.onclose = function(message){};
		webSocket.onerror = function(message){};
		webSocket.onmessage = function(message){
			let node = JSON.parse(message.data);
			
			if(node.status === "visit"){
				
			}else if(node.status==="message"){
				let $div = $(".template");
				log = $div.find(".console").val();
				var message = node.message;
				var arr = message.split("-");
				var hospital_reserve_id = arr[2];
				var id = '${id}';
				ajax_get_reserveInfo(hospital_reserve_id, id);
				//ajax로 예약 번호, 로그인한 병원 아이디에 해당하는 환자의 정보를 불러옴
				//ex) 이전 페이지에서 받아 온 정보 : 74 - myeongji - 51
				//ajax로 받아온 정보 : 홍길동 - 2020-01-01 - 09:00:00
			}else if(node.status==="bye"){
				//$("[data-key='"+node.key+"']").remove();
			}
		};

		function ajax_get_reserveInfo(hospital_reserve_id, id){
			var data = {
					hospital_reserve_id : hospital_reserve_id,
					id : id
					}
			
			$.ajax({
					url : '${pageContext.request.contextPath}/rest/guestInfo',
					type : 'post',
					data : JSON.stringify(data),
					dataType : 'json',
					contentType : 'application/json',
					success : function(response){
						name = response.name;
						date = response.date;
						time = response.time;
						info = name + " - " + date + " - " + time;
						getGuestInfo(info);
						},
					error : function(xhr,status,error){
						console.error(error);
						}
				});
			}
	</script>	
	<table class="table table-hover">
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>날짜</th>
			<th>시간</th>
		</tr>
		<c:forEach var="list" items="${dto }">		<!-- 예약현황 보여주는 코드 -->
			<tr>
				<td>${list.id} </td>
				<td>${list.name}</td>
				<td>${list.date}</td>
				<td>${list.time }</td>
			</tr>
		</c:forEach>
	</table>
<script>
//현재 시간
$(function(){
/* var today = new Date();
var hh = today.getHours();
var mi = today.getMinutes();
var ss = today.getSeconds(); */

setTimeout(function(){				//1분마다 새로고침 되는 코드
	   window.location.reload(1);
	 //  alert("!");
	}, 60000); //1분  
	//5분 300000
/* document.write(today);
setTimeout("location.reload()",60000) */
/* var timer = setInterval(function(){
	console.log(today);
	alert("1");
},60000); */

	
});
</script>	
</body>
</html>