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
</style>
<script>
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

$(function(){
	//하나만 체크하는 상품인 경우
	$("input.oneChk").click(function(){
		if($(this).is(":checked") == true){
				var price = $(this).parent().find(".price").val();
				var title = $(this).parent().find(".title").html();
				index = getIndex(title);
				totalArray[index] = price;
				priceCalc();
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
							priceCalc();
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
			
			function priceCalc(){
				var sum = 0;
				for(var i = 0; i<totalArray.length; i++){
						sum = sum + Number(totalArray[i]);
						if(sum > 16500){
							alert("20,000원 이하로 선택 가능합니다.");
							break;
							}
					}
				$(".total").html(sum);
					
				}
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
			<div class="total"></div>/20,000
			<input type="submit" value="다음" class="btn btn-primary"
				style="float: right;" />
		</form>
		<br /> <br />
	</div>
<div class="footer">
	<%@ include file = "./footer.jsp" %>
</div>
</body>

</html>