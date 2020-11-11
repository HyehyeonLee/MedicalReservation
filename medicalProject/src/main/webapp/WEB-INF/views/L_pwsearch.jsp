<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<script type="text/javascript">
	function send(){
		alert("임시비밀번호가 입력하신 메일로 발송되었습니다.");
	}
	
</script>
<br />
<form action="sendpw.do" name="pwsearch" method="post" style = "width : 40%; padding : 20px;">
	<input type="text" name="id" placeholder="아이디" required="" class="form-control"/><br/>
	<input type="text" name="email" placeholder="이메일" required="" class="form-control"/><br/>
	<button type="submit" onclick="send()" class="btn btn-primary">비밀번호 찾기</button>
</form>	
</body>
</html>