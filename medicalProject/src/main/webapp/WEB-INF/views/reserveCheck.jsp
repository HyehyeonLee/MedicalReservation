<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file = "./include_file.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
<style>
	.reserveItem{
		width : 60%;
		margin : 0 auto;
		border : 1px solid #8c8c8c;
		padding : 20px;
		text-align: center;
		box-shadow: 5px 5px 5px 5px #8c8c8c;
		border-radius:5px;
		margin-bottom : 50px !important;
	}
	
	.delBtn{
		border : 0;
		outline : 0;
		background-color: white;
	}
	
	.sub-title {
	padding: 20px;
	color: #5c5c5c;
}
</style>
<script>
	$(function(){
		$(".delBtn").click(function(){
			if(confirm("예약을 취소하시겠습니까?")){
					var guest_reserve_id = $(this).parent().find(".guest_reserve_id").val();
					ajax_delete_reserve(guest_reserve_id);
				}
			});
		
		});

	function ajax_delete_reserve(guest_reserve_id){
		var data = {
				guest_reserve_id : guest_reserve_id
				}
		
		$.ajax({
				url : '${pageContext.request.contextPath}/rest/deleteAc',
				type : 'post',
				data : JSON.stringify(data),
				dataType : 'text',
				contentType : 'application/json',
				success : function(response){
						var delSuccess = response;
						if(delSuccess === "success"){
							alert('예약이 취소 되었습니다.');
							location.href = "${pageContext.request.contextPath }/reserve/reserveCheck?id=${dto.id}";
						}
					},
				error : function(xhr,status,error){
						alert("!!err" + error);
					}
			});
		}
</script>
</head>
<body>
	 <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content" >
	<h2 class="sub-title">예약 조회</h2>
		<c:choose>
			<c:when test = "${empty reserveDto }">
			<div class = "inform">
				<p class = "">예약 결과가 없습니다.</p>			
			</div>
			</c:when>		
			<c:otherwise>
				<c:forEach var="list" items="${reserveDto }">
					<div class="reserveItem">
						<c:out value = "${list.name }" />&nbsp;&nbsp;
						<c:out value = "${list.date }" />&nbsp;&nbsp;
						<c:out value = "${list.time }" />&nbsp;&nbsp;
						<input type="hidden" name="guest_reserve_id" class="guest_reserve_id" value="${list.guest_reserve_id }"/>
						<br />
						<a href="javascript:void(0);" class ="delBtn">
					<svg width="10px" height="10px" viewBox="0 0 16 16" class="bi bi-check-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
	  <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
	  </svg>
					예약 취소</a>
					</div>
				
				</c:forEach>
		<!--예약결과가 null일 경우  -->
	
	</c:otherwise>
	</c:choose>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	</body>
</html>