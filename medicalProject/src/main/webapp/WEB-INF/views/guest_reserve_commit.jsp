<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="./include_file.jsp"%>
<script type="text/javascript">
var webSocket;
function sendMessage() {
	let message = $("input.guest_id").val() + " - " + $("input.yadmNm").val() + " - " +
	 $("input.hospital_id").val() + " - " + $("input.hospital_reserve_id").val();
	webSocket.send(message);
}

$(function(){
		webSocket = new WebSocket("ws://localhost:9096/www/broadsocket");
		
		webSocket.onopen = function(message) {
			sendMessage();
		};
	
		
		webSocket.onclose = function(message) {
			
		};
		
		webSocket.onerror = function(message) {
			alert("error!");
		};
		
		webSocket.onmessage = function(message) {
	
		};
	
		$(".okBtn").click(function(){
			let message = $("input.guest_id").val() + " - " + $("input.yadmNm").val() + " - " +
			 $("input.hospital_id").val() + " - " + $("input.hospital_reserve_id").val();
			webSocket.send(message);
	
		});

		$(".noBtn").click(function(){
			history.back(-1);
		});
	

});
</script>
</head>
<body>
	<input type="hidden" class="guest_id" value="${guest_id }" />
	<input type="hidden" class="yadmNm" value="${yadmNm }" />
	<input type="hidden" class="hospital_id" value="${hospital_id }" />
	<input type="hidden" class="hospital_reserve_id"
		value="${hospital_reserve_id }" />
	<h1>${guest_id }님</h1>
	<h1>${ yadmNm}예약 완료되었습니다.</h1>
	<h1>${hospital_id }</h1>
	
</body>
</html>