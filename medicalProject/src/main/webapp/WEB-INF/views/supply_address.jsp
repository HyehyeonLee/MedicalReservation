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
	#consult{
		float: right;
	    position: relative;
	    right: 70px;
	    top: 283px;
	    position: fixed;
	    right: 60px;
	    margin-top: 90px;
	    cursor:pointer;
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
			<input type="button" value="아니오(주소지 수정)" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/editInfo?id=${dto.id}'"/>
		</div>
</c:if>
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