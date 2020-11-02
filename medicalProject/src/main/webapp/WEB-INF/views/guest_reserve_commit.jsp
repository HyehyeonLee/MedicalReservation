<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 완료</title>
<script type="text/javascript">
	var webSocket;
	function sendMessage() {
		let message = $("input.guest_id").val() + "-"
				+ $("input.hospital_id").val() + "-"
				+ $("input.hospital_reserve_id").val();
		webSocket.send(message);
	}

	$(function() {
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

	});
</script>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<input type="hidden" class="guest_id" value="${guest_id }" /> <input
			type="hidden" class="yadmNm" value="${yadmNm }" /> <input
			type="hidden" class="hospital_id" value="${hospital_id }" /> <input
			type="hidden" class="hospital_reserve_id"
			value="${hospital_reserve_id }" />
		<h1>${guest_id }님</h1>
		<h1>${ yadmNm} 예약 완료 되었습니다.</h1>
		<input type="button" value="메인화면" onclick="location.href='${pageContext.request.contextPath}/index'" class = "btn btn-info"/>
		<input type="button" value="예약조회" onclick="location.href='#'" class = "btn btn-success"/>
	</div>

	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>