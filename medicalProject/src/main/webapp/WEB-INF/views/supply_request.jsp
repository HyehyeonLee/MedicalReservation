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
</style>
<script>
$(function(){
	/* 			if($("input:checkbox[class='supplyChk']").is(":checked") == false){
					alert("!");
				}
	 */
	 		$("input.supplyChk").click(function() {
				if($(this).is(":checked") == true){
					$(this).parent().find(".qty").removeAttr("disabled");
					$(this).parent().find(".qty").val(1);
					$(this).parent().find(".plusBtn").removeAttr("disabled");
					$(this).parent().find(".minusBtn").removeAttr("disabled");

				}else{
						$(this).parent().find(".qty").attr("disabled","disabled");
						$(this).parent().find(".qty").val("");
						$(this).parent().find(".plusBtn").attr("disabled","disabled");
						$(this).parent().find(".minusBtn").attr("disabled","disabled");
				};
	 	 	});
				$(".plusBtn").click(function(){
					var price = $(this).parent().find(".price").val();
					var qty = $(this).parent().find(".qty").val();
					
					if(qty < 10){
							qty++;
							var mul = price * qty;
							$(this).parent().find(".totalPrice").val(mul);
							$(this).parent().find(".qty").val(qty);
						}
					if(qty == 10){
						alert("10개까지 선택 가능합니다");
						}
				});

				
				$(".minusBtn").click(function(){
					var totalPrice = $(this).parent().find(".totalPrice").val();
					var price = $(this).parent().find(".price").val();
					var qty = $(this).parent().find(".qty").val();
					if(qty > 1){
							--qty;
							var div = totalPrice / qty;
							
							if(qty == 1){
								$(this).parent().find(".totalPrice").val(price);
								$(this).parent().find(".qty").val(qty);
							}else{
								$(this).parent().find(".totalPrice").val(div);
								$(this).parent().find(".qty").val(qty);
							}
						}
				});
				
			})
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
						<!--  <img src="${supply.img}" /> -->
						<label><c:choose>
								<c:when test="${supply.plural == 1 }">
								<input type="checkbox" value="${supply.code }" class="supplyChk"/>
								<c:out value="${supply.title }" />
								<br />
									<input type="hidden" name="" class="price" value="${supply.price }" />
									<input type="text" name="" id="totalPrice" class="totalPrice" value="${supply.price }" readonly="readonly"/><br />
									<input type="button" value="-" class = "minusBtn" disabled="disabled"/>
									<input type="text" width = "20px" class="qty" disabled="disabled" readonly="readonly"/>
									<input type="button" value="+" class = "plusBtn" disabled="disabled"/>
									<br />
								</c:when>
								<c:when test="${supply.plural == 0 }">
									<input type="radio" name="hobby" value="${supply.code }" />
									<c:out value="${supply.title }" />
								</c:when>
							</c:choose> 
						</label> <br />
						</div>
					</li>
				</c:forEach>
					</ul>
			</div>
			<input type="submit" value="다음" class="btn btn-primary"
				style="float: right; margin-top: -50px;" />
		</form>
		<br /> <br />
	</div>
	
</body>

</html>