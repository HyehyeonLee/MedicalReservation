<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건의 사항</title>
<style>
.sub-title {
	padding: 20px;
	color: #5c5c5c;
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
	<h2 class="sub-title">건의 사항 접수</h2>
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
