<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 확인</title>
<script>
	$(function(){
			$("#okBtn").click(function(){
					alert('신청 완료 되었습니다!');
					location.href = '${pageContext.request.contextPath}/index';
				});
		});
</script>
<style>
	.address-inform{
		width : 60%;
		margin : 0 auto;
		border : 1px solid #8c8c8c;
		padding : 20px;
		text-align: center;
		box-shadow: 5px 5px 5px 5px #8c8c8c;
		border-radius:5px;
	}
	
	.address{
		font-weight: bold;
		text-decoration: underline;
	}
</style>
</head>
<body>
<div class="header">
	<%@ include file = "./header.jsp" %>
</div>
<div class="content">
<br />
<br />
<c:if test="${!empty memDto}">
		<div class = "address-inform">
			<p>${memDto.name }님, 선택하신 구호 물품이 다음 주소로 발송됩니다.</p>
			<p class="address"><c:out value = "${memDto.addr }" /> <c:out value = "${memDto.extraAddress }" /></p>
			<p class="address"><c:out value = "${memDto.detailAddress }" /></p>
			<p>상기된 주소가 맞습니까?</p>
			<br />
			<input type="button" value="예(물품 신청 완료)" id="okBtn" class="btn btn-primary"/>
			<input type="button" value="아니오(주소지 수정)" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/editInfo'"/>
		</div>
</c:if>
</div>   
<div class="footer">
	<%@ include file = "./footer.jsp" %>
</div>
</body>
</html>