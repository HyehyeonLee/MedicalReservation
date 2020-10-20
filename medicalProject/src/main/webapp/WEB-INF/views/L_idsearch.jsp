<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!--
<script>
$(function(){
// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var name = $("#name").val();
	var email = $("#email").val();
	var url = "${pageContext.request.contextPath}/idSearchAction?name="+name+"email"+email;
	
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/idSearchAction?name="+name+"email"+email,	//"${pageContext.request.contextPath}/user/userSearch?inputName_1=" 
				//	+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
			
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
		alert(url);
	}
	
});

</script> -->
<script>
$(function(){
	alert($("#demoId").val());
});

</script>
<input type = "hidden" id = "demoId" value = "<%=session.getAttribute("demoId") %>">
	<form action="${pageContext.request.contextPath}/idSearchAction" method="POST">
		<input type="text" name="name" id = "name" placeholder="Ex)홍길동"/><br/>
		<input type="text" name="email" id = "email" placeholder="Ex)aa@gmail.com"/><br/>
		<input type="submit" value="아이디찾기" />
		<!-- <button type="submit" onclick="idSearch_click();">아이디 찾기</button>  -->
	</form>
</body>
</html>