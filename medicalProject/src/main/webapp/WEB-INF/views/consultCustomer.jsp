<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<form>
		<button id="btnRequest" type="button" onclick="openSocket();">대화방 참여</button> 
		<input id="textMessage" type="text" readonly="readonly" onkeydown="return enter()" style="width:280px;">
		<input onclick="sendMessage()" value="Send" type="button">
		<button type="button" id="btnQuit" onclick="closeSocket();" style="display:none;">상담 종료</button>
	</form>
	<br/>
	<textarea id="messageTextArea" rows="10" cols="50" disabled="disabled"></textarea>
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://localhost:9096/www/broadsocket");
		var messageTextArea = document.getElementById("messageTextArea");
		var accept = "상담이 연결되었습니다.";
		var talk = "상담이 요청되었습니다.";
		function removeReadonly(){
			$("#textMessage").removeAttr("readonly");
			//$("#messageTextArea").css('display','block');
			$("#btnRequest").css('display', 'none');
			$("#btnRequest").css('display', 'none');
			$("#btnQuit").css('display', 'block');
		}
		
		function openSocket(){ 
			webSocket.onopen = messageTextArea.value += "Server connect...\n";
	         let message = document.getElementById("textMessage");
	         messageTextArea.value +="${dto.id}"+"님 "+ talk + "\n";
	        // message.value="대화요청";
	        webSocket.send(talk);    // "상담이 요청되었습니다." 를 admin에 메시지 전송.
		}
		
		webSocket.onclose = function(message){
			webSocket.send("(클라이언트가 나갔음)");
			//alert("close");
			$("#btnQuit").css('display', 'none');
			$("#btnRequest").css('display', 'block');
			};
		webSocket.onerror = function(message){
			messageTextArea.value += "error...\n";
		};
		webSocket.onmessage = function(message){
			//alert("message도착");
			//alert("message도착(index.jsp): " + message.data);
			//alert("accept : " + accept);
			if(message.data==accept){
//				alert("!");
//				alert(message.value);
//				$("#textMessage").attr("readonly",true);
				removeReadonly();
			}
			messageTextArea.value += "상담원 : "+message.data + "\n";
		};
		function sendMessage(){
			let message = document.getElementById("textMessage");
			messageTextArea.value +="${dto.id}"+ message.value + "\n";
			webSocket.send(message.value);
			message.value="";
		}
		function enter(){
			if(event.keyCode === 13){
				sendMessage();
				return false;
			}
			return true;
		}
		function closeSocket(){ 
			var result=confirm("상담을 종료하시겠습니까?");
			if(result){
				webSocket.onclose();
				var win=window.open("","_self");
			    win.close();
			}else{
				return "redirect:/soc2/index";
			}

			
			//alert("!");
			//alert("@");
			//window.open('about:blank','_self').close();	 
			//window.open('','_self').close();
						
		} 
	</script>
</body>
</html>