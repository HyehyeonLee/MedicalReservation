<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

<h2>이메일 보내기</h2>
<form method="post" action="${pageContext.request.contextPath}/SuggSend.do"> 
<!-- post방식으로 자료를 컨트롤러로 보냄 -->
 
발신자 이름 : <input name="senderName" value="${dto.id }" readonly="readonly"><br/>
발신자 이메일 : <input name="sender" value="${dto.email }" readonly="readonly"><br/>
수신자 이메일 : <input name="receiver" value="adoo9333@gmail.com" readonly="readonly"><br/>
제목 : <input name="subject"><br/>
내용 : <textarea rows="5" cols="80" name="content"></textarea>
<br>
<input type="submit" value="전송">
</form>
<span style="color:red;">${message}</span>
 
</body>
</html>
