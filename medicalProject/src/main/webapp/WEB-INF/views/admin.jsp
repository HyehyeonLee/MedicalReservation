<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</body>
</html>