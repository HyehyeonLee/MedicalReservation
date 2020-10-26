<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 조회</title>
<script>
	$(function(){
		$(".reserveBtn").click(function(){
			var reserve_id = $(this).parent().find("#hospital_reserve_id").val();
			location.href = "${pageContext.request.contextPath}/reserveCommit?hospital_reserve_id="+reserve_id;
			//var id = $("#reserveBtn").prev().prev().prev().prev().val();
		});

	});
</script>
</head>
<body>
<%@ include file="./header.jsp"%>
<c:forEach var="reserve" items="${reserve }">
	<div id="reserveItem">	
		<input type="hidden" id="hospital_reserve_id" value = "${reserve.hospital_reserve_id }"/>
		<c:out value = "${reserve.hospital_id }" />,
		<c:out value = "${reserve.date}" />,
		<c:out value = "${reserve.time }" />
		<!-- <input type="button" value="예약" id = "reserveBtn" 
			onclick="location.href = '${pageContext.request.contextPath}/reserveCommit?hopital_reserve_id=${reserve.hospital_reserve_id}'"
		/>  -->
		<input type="button" value="예약" id = "reserveBtn" class="reserveBtn" />
	</div>
	<br />
</c:forEach>
</body>
</html>