<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 상담 :: 회원</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<body>


	<div class="wrap">	

		<div class="chat">
			<form>
				<div class="form-group">
					<button id="btnRequest" class="btn btn-outline-primary" type="button" onclick="openSocket();">대화방 참여</button> 
				</div>

				<div class="form-group">
					<input id="textMessage" class="form-control" type="text" readonly="readonly" onkeydown="return enter()" style="width:320px; float:left; margin-left:10px; margin-right:10px;">
				</div>
	
				<div class="form-group">
					<button type="button" class="btn btn-outline-primary" onclick="sendMessage()" value="Send" type="button" style="float:left;">Send</button>
				</div>
				
				<div>
				<button id="btnQuit" class="btn btn-outline-primary" type="button"  onclick="closeSocket();" style="display:none; float : left;">상담 종료</button>
				</div>
			</form><br/>
			<textarea id="messageTextArea" rows="10" cols="50" disabled="disabled" style = "resize: none;"></textarea>
		</div>
		
	</div>

	<style>
		/* .chat{
		    display: block;
		    margin: 0 auto;
		    width: 550px;
		    border: 1px solid black;
		    margin-top: 200px;
		    margin-bottom: 200px; 
			} */
			    
		    #btnRequest{
		    	font-size:11px;
		    	float:left;
		    }
			#messageTextArea{
				position: relative;
				left:90px;
				top:20px;
			}
	</style>

	<script type="text/javascript">
		var webSocket = new WebSocket("ws://192.168.4.147:9096/www/broadsocket");
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
		} 
	</script>
</body>
</html>