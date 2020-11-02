<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>
$(function(){
	$("#checkGrade").click(function(){
		var id = '${dto.id}';
		ajax_checkGrade(id);
	});

	function checkGradeMsg(grade){
		if(grade == "hospital"){
			location.href = "${pageContext.request.contextPath}/hospitalPage";
		}else if(grade == "guest"){
			alert('기관 회원만 이용 가능합니다.');
		}else{
			alert('회원 가입 후 이용 가능합니다.');
		}
	}
	
});

function ajax_checkGrade(id){
	var data = {
			id : id
			}
	
	$.ajax({
			url : '${pageContext.request.contextPath}/rest/checkGrade',
			type : 'post',
			data : JSON.stringify(data),
			dataType : 'json',
			contentType : 'application/json',
			success : function(response){
				alert("!");
				grade =  response;
				alert(grade);
				},
			error : function(xhr,status,error){
				alert("!!err");
				}
		});
	}
</script>
<style>
table {
	margin: 0 auto;
	border-collapse: collapse;
	text-align: center;
}

table tr td {
	padding: 50px;
}

table tr td a{
	text-decoration: none;
	color : #5c5c5c;
}
</style>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	<div class="content">
		<table>
			<tr>
				<td>
				<a href="${pageContext.request.contextPath }/editInfo">
				<svg width="100px" height="100px" viewBox="0 0 16 16" class="bi bi-person-badge" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M2 2.5A2.5 2.5 0 0 1 4.5 0h7A2.5 2.5 0 0 1 14 2.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2.5zM4.5 1A1.5 1.5 0 0 0 3 2.5v10.795a4.2 4.2 0 0 1 .776-.492C4.608 12.387 5.937 12 8 12s3.392.387 4.224.803a4.2 4.2 0 0 1 .776.492V2.5A1.5 1.5 0 0 0 11.5 1h-7z"/>
  <path fill-rule="evenodd" d="M8 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6zM6 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5z"/>
</svg><br />
				회원 정보 수정</a></td>
				<td>
				<a href="${pageContext.request.contextPath }/reserveCheck">
				<svg width="100px" height="100px" viewBox="0 0 16 16" class="bi bi-check-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z"/>
</svg><br />
				예약 조회</a></td>
			</tr>
			<tr>
				<td>
				<a href="javascript:void(0);" id="checkGrade">
				<svg width="100px" height="100px" viewBox="0 0 16 16" class="bi bi-building" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694L1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
  <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
</svg><br />
				기관 회원 페이지</a></td>
				<td><a href="#"></a></td>
			</tr>
		</table>
	</div>
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>