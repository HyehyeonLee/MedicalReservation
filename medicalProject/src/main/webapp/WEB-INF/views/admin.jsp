<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
		var webSocket = new WebSocket("ws://localhost:9096/www/admin");
		webSocket.onopen = function(message){};
		webSocket.onclose = function(message){};
		webSocket.onerror = function(message){};
		webSocket.onmessage = function(message){
			let node = JSON.parse(message.data);
			
			if(node.status === "visit"){
				//let form = $(".template").html();
				//form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form);
				//$("body").append(form);
			}else if(node.status==="message"){
				//let $div = $("[data-key='"+node.key+"']");
				let $div = $(".template");
				let log = $div.find(".console").val();
				$div.find(".console").val(log+"(user)=>"+node.message+"\n");
			}else if(node.status==="bye"){
				//$("[data-key='"+node.key+"']").remove();
			}
		};
		$(document).on("click",".sendBtn", function(){
			let $div = $(this).closest(".float-left");
			let message = $div.find(".message").val();
			let key = $div.data("key");
			let log = $div.find(".console").val();
			$div.find(".console").val(log+"(me)=>"+message+"\n");
			$div.find(".message").val("");
			webSocket.send(key+"####"+message);
		});
		$(document).on("keydown", ".message", function(){
			if(event.keyCode === 13){
				$(this).closest(".float-left").find(".sendBtn").trigger("click");
				return false;
			}
			return true;
		});
		
	</script>	
</body>
</html>