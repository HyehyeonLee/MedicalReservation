<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function send(){
		alert("임시비밀번호가 입력하신 메일로 발송되었습니다.");
	}
	
</script>
<form action="sendpw.do" name="pwsearch" method="post">
	<input type="text" name="id" placeholder="아이디" required=""/><br/>
	<input type="text" name="email" placeholder="이메일" required=""/><br/>
	<button type="submit" onclick="send()">비밀번호 찾기</button>
</form>	
</body>
</html>