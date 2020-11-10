<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 상담 :: 기관</title>
<style>
.float-left {
	float: left;
	margin: 5px;
}
</style>
</head>
<body>
	<div>
		<p>현재 상담 인원 :</p>
		<input id="nowTalk" readonly="readonly">
		<p>현재 대기 인원 :</p>
		<input id="waitingTalk" readonly="readonly">
		<button type="button" onclick="nowSituation();">인원 확인</button>
	</div>
	<div class="template" style="display: none">
		<form>
			<input type="text" class="message"
				onkeydown="if(event.keyCode === 13) return false;"
				style="width: 280px;"> <input value="Send" type="button"
				class="sendBtn">
			<button type="button" class="acceptBtn" onclick="acceptSocket();">수락</button>
			<button type="button" id="btnQuit" onclick="closeSocket();" style="display:none;">상담 종료</button>
		</form>
		<br />
		<textarea rows="10" cols="50" id="console" class="console"
			disabled="disabled"></textarea>
	</div>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		var count = 0; // 대화중인 명 수
		var webSocket = new WebSocket("ws://localhost:9096/www/admin");
		var acceptS = "상담이 연결되었습니다.";
		//var bWaiting = false;   // bWating:수락을 기다리는 상황인지 여부. (true:누군가 상담신청해놓고 기다리고 있음.)
		
		function nowSituation() {
			if (count <= 4) {
				document.getElementById("nowTalk").value = count;
				document.getElementById("waitingTalk").value = "없음";
				alert("상담중인 인원은  " + count + "명 입니다.");
			} else {
				document.getElementById("nowTalk").value = "4";
				document.getElementById("waitingTalk").value = count - 4;
				alert("모든 상담원이 상담을 하고 있습니다.");
				alert("대기인원 " + (count - 4) + "명 있습니다.");
			}
		}

		/* function updateAcceptButton() {
			if(bWaiting==true)
				$(".acceptBtn").removeAttr("disabled");
			else 
				$(".acceptBtn").attr("disabled", "disabled");
		} */

		webSocket.onopen = function(message) {
			alert("오픈(admin)");
		};

		webSocket.onclose = function(message) {
			$(".template").css('display', 'none');
		};

		webSocket.onerror = function(message) {
			alert("에러(admin)" + message);
		};

		webSocket.onmessage = function(message) {
			if (JSON.parse(message.data).message == "(클라이언트가 나갔음)") {
				count--;
				alert("admin:클라이언트가 나갔음. 이제 count:" + count);
			}
			/* if(JSON.parse(message.data).message == "상담이 요청되었습니다.") {
				bWaiting = true;
				updateAcceptButton();
			} */

			let node = JSON.parse(message.data);
			if (node.status === "visit") {
				let form = $(".template").html();
				form = $("<div class='float-left'></div>").attr("data-key",
						node.key).append(form);
				$("body").append(form);
			} else if (node.status === "message") {
				let $div = $("[data-key='" + node.key + "']");
				let log = $div.find(".console").val();
				$div.find(".console").val(
						log + "${dto.id }"+"님께서 " + node.message + "\n");
			} else if (node.status === "bye") {
				$("[data-key='" + node.key + "']").remove();
			}
		};
		$(document).on("click", ".sendBtn", function() {
			let $div = $(this).closest(".float-left");
			let message = $div.find(".message").val();
			let key = $div.data("key");
			let log = $div.find(".console").val();
			$div.find(".console").val(log + "(me)=>" + message + "\n");
			$div.find(".message").val("");
			webSocket.send(key + "####" + message);
		//	alert(key);
		//	alert(message);
		});
		$(document).on(
				"keydown",
				".message",
				function() {
					if (event.keyCode === 13) {
						$(this).closest(".float-left").find(".sendBtn")
								.trigger("click");
						return false;
					}
					return true;
				});

		$(document).on("click", ".acceptBtn", function acceptSocket() {
			count++;
			if (count <= 4) {
				alert("count = " + count);
			} else {
				alert("count :5이상");
			}
			if (count > 4) {
				webSocket.send("모든 상담사가 상담중입니다. 잠시후 다시 시도해주세요.");
			}
			/* bWaiting = false;
			updateAcceptButton(); */
			
			let $div = $(this).closest(".float-left");
			let message = $div.find(".message").val();
			let key = $div.data("key");
			let log = $div.find(".console").val();
			$div.find(".console").val(log + "(me)=>" + message + "\n");
			$div.find(".message").val("");
			webSocket.send(key + "####" + acceptS);
			$("#btnQuit").css('display', 'block');
			//alert(key);
			//alert("admin : " + acceptS);
			//webSocket.send(key+"####"+"상담 연결되었습니다.");
		});
		
		function closeSocket(){ 
			var result=confirm("상담을 종료하시겠습니까?");
			if(result){
				webSocket.onclose();
			}else{
				return "redirect:/soc2/admin";
			}
		}
	</script>
</body>
</html>