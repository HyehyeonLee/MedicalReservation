<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta http-equiv="refresh" content="URL=http://localhost:9096/www/reserve/admin">
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
		<textarea rows="10" cols="50" class="console" disabled="disabled"></textarea>
	</div>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	let log;
	function getGuestInfo(info){
		//$div.find(".console").val(log+"(user)=>"+info+"\n");
		alert(info);
		$(".console").val(log + "(new) " + info + "\n");
	}
	
		var webSocket = new WebSocket("ws://localhost:9096/www/admin");
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
				//여기까진 성공함
				ajax_get_reserveInfo(hospital_reserve_id);
				
			}else if(node.status==="bye"){
				//$("[data-key='"+node.key+"']").remove();
			}
		};

		

		
		function ajax_get_reserveInfo(hospital_reserve_id){
			var data = {
					hospital_reserve_id : hospital_reserve_id,
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
//						return guestInfo;
						},
					error : function(xhr,status,error){
						alert("!!err");
						}
				});
			}
	</script>	
	<table class="table">
		<tr>
			<td><h1>id</h1></td>
			<td><h1>name</h1></td>
			<td><h1>date</h1></td>
			<td><h1>time</h1></td>
		</tr>
		<c:forEach var="list" items="${dto }">
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

setTimeout(function(){
	   window.location.reload(1);
	 //  alert("!");
	}, 500000);
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