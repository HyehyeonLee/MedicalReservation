<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 신청</title>
<style type="text/css">
.item {
	width: 33%;
	display: inline-block;
	float: left;
	text-align: center;
}

img {
	width: 50%;
	margin-left:30px;
}

ul{
	list-style: none;
}

.sub-title {
	padding: 20px;
	color: #5c5c5c;
}

.totalPrice{
	border : 0px;
	text-align: center;
}

.qty{
	border : 0px;
	width : 50px;
	text-align: center;
}

.plusBtn, .minusBtn{
	border : 0px;
	outline : 0;
	color : black;
	font-weight: bold;
}
#consult {
	float:right;
	right:-60px;
	position: absolute;
	height: 400px;
	top: 10px;
	cursor:pointer;
}
</style>
<script>
	var sum = 0;
	var titleArray = new Array();
	<c:forEach var="supply" items="${supply }">
		titleArray.push("${supply.title}");
	</c:forEach>

	var totalArray = new Array(titleArray.length);
	totalArray.fill(0);

//상품명을 매개변수로 받아 배열의 인덱스를 구함
function getIndex(title){
	var index;
	for(index = 0; index<titleArray.length; index++){
		if(titleArray[index] === title)
			break;
		};
	return index;
}

function priceCalc(){ //총합계를 구하는 함수
	sum = 0;
	for(var i = 0; i<totalArray.length; i++){
			sum = sum + Number(totalArray[i]);
			if(sum > 20000){
				alert("20,000원 이하로 선택 가능합니다.");
				return false;
				}
		}
	$(".total").html(sum);
		return true;
	}

$(function(){
	//하나만 체크하는 상품인 경우
	$("input.oneChk").click(function(){
		if($(this).is(":checked") == true){
				var price = $(this).parent().find(".price").val();
				var title = $(this).parent().find(".title").html();
				index = getIndex(title);
				totalArray[index] = price;
				
				if(priceCalc() == false) { 
					$(this).attr('checked', false );
				}
			}else{
				var title = $(this).parent().find(".title").html();
				index = getIndex(title);
				totalArray[index] = 0;
				priceCalc();
				}
		});
	
	 //체크박스가 선택 되어야 수량을 조절할 수 있음
	 		$("input.supplyChk").click(function() {
				if($(this).is(":checked") == true){
					$(this).parent().find(".qty").removeAttr("disabled");
					$(this).parent().find(".qty").val(1);
					$(this).parent().find(".plusBtn").removeAttr("disabled");
					$(this).parent().find(".minusBtn").removeAttr("disabled");

					var title = $(this).parent().find(".title").html();
					index = getIndex(title);
					totalArray[index] = $(this).parent().find(".totalPrice").val();
					priceCalc();
					
				}else{ //체크박스가 풀리면 수량 조절을 못하게 함(disabled 속성 추가)
						$(this).parent().find(".totalPrice").val($(this).parent().find(".price").val());
						$(this).parent().find(".qty").attr("disabled","disabled");
						$(this).parent().find(".qty").val("");
						$(this).parent().find(".plusBtn").attr("disabled","disabled");
						$(this).parent().find(".minusBtn").attr("disabled","disabled");

						var title = $(this).parent().find(".title").html();
						index = getIndex(title);
						totalArray[index] = 0;
						priceCalc();

						
				};
	 	 	});

	 			//수량 플러스 버튼 이벤트
				$(".plusBtn").click(function(){
					var price = $(this).parent().find(".price").val();
					var qty = $(this).parent().find(".qty").val();
					var title = $(this).parent().find(".title").html();
					/* alert(getIndex(title)); */
					index = getIndex(title);
					if(qty < 10){ //수량이 10개 미만일 때까지만 수량 조절 가능
							qty++;
							var mul = price * qty;
							$(this).parent().find(".totalPrice").val(mul);
							totalArray[index] = mul;
							if(priceCalc() == false) { 
								qty--; 
								var mul = price * qty;
								$(this).parent().find(".totalPrice").val(mul);
								totalArray[index] = mul;
								priceCalc();
							 }
							$(this).parent().find(".qty").val(qty);
						}
					if(qty == 10){ //수량은 10개만 선택 가능
						alert("10개까지 선택 가능합니다");
						}
				});

				//수량 마이너스 버튼 이벤트
				$(".minusBtn").click(function(){
					var totalPrice = $(this).parent().find(".totalPrice").val();
					var price = $(this).parent().find(".price").val();
					var qty = $(this).parent().find(".qty").val();
					var title = $(this).parent().find(".title").html();
					index = getIndex(title);
					if(qty > 1){ //수량은 1개 이상으로만 조절 가능
							qty--;
							var minus = totalPrice - price;
							$(this).parent().find(".totalPrice").val(minus);
							totalArray[index] = minus;
							priceCalc();
							$(this).parent().find(".qty").val(qty);
							/* if(qty == 1){
								$(this).parent().find(".totalPrice").val(price);
								$(this).parent().find(".qty").val(qty);
							}else{
								
							} */
						}
				});
			});

//상담버튼 따라다니게 하는 제이쿼리
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#consult").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

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
		
</script>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<h2 class="sub-title">구호 물품 신청</h2>
		<br />
		<form action="${pageContext.request.contextPath }/supply/address" method="get">
		<input type="hidden" name="id" value="${dto.id }" />
			<div class="supply-wrap">
				<ul>
				<c:forEach var="supply" items="${supply }">
					<li>
						<div class = "item">
						<img src="${pageContext.request.contextPath }/resources/img/${supply.code}.jpg" />
						<br />
						<label><c:choose>
								<c:when test="${supply.plural == 1 }"><!-- 여러 개 선택 가능한 경우 -->
								<input type="checkbox" value="${supply.code }" class="supplyChk" name="supplyChk"/>
								<p class="title"><c:out value="${supply.title }" /></p>
								<%-- <input type="text" class="title" value="${supply.title }" readonly="readonly"/> --%>
								
								<br />
									<input type="hidden" name="" class="price" value="${supply.price }" />
									<input type="text" name="" id="totalPrice" class="totalPrice" value="${supply.price }" readonly="readonly"/><br />
									<input type="button" value="-" class = "minusBtn" disabled="disabled"/>
									<input type="text" width = "20px" class="qty" disabled="disabled" readonly="readonly"/>
									<input type="button" value="+" class = "plusBtn" disabled="disabled"/>
									<br />
								</c:when>
								<c:when test="${supply.plural == 0 }"><!-- 하나만 선택 가능한 경우 -->
									<input type="checkbox" value="${supply.code }" class="oneChk" name="supplyChk"/>
									<p class="title"><c:out value="${supply.title }" /></p>									
									<input type="hidden" name="" class="price" value="${supply.price }" />
									<input type="text" name="" id="totalPrice" class="totalPrice" value="${supply.price }" readonly="readonly"/><br />
								</c:when>
							</c:choose> 
						</label> <br />
						</div>
					</li>
				</c:forEach>
					</ul>
			</div>
			<span></span>
			<div class="total"></div>/20,000
			<input type="submit" value="다음" class="btn btn-primary"
				style="float: right;" />
		</form>
		<br /> <br />
		<!-- 상담 채팅 아이콘 -->
		<div class="chat-doot">
		<svg width="50px" height="50px" float="right" viewBox="0 0 16 16" id="consult" onclick="nwindow();" class="bi bi-chat-dots-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 		<path fill-rule="evenodd" d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		</svg>
	</div>
	</div>
<div class="footer">
	<%@ include file = "./footer.jsp" %>
</div>
</body>

</html>