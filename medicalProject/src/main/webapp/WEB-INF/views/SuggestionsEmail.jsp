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
</style>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<body>
	<div class="header">
		<%@ include file = "./header.jsp" %>
	</div>

	<div class="content">
		<h2 class="sub-title">건의 사항 접수</h2>
		<form method="post" action="${pageContext.request.contextPath}/SuggSend.do"> 
			<!-- post방식으로 자료를 컨트롤러로 보냄 -->

			<div class="form-group">
				<label>발신자 이름 </label>
				<input name="senderName" value="${dto.id }" class="form-control" readonly="readonly"><br/>
			</div>		
						
			<div class="form-group">
				<label>발신자 이메일</label>
				<input name="sender" value="${dto.email }" class="form-control" readonly="readonly"><br/>
			</div>
			
			<div class="form-group">
				<label>수신자 이메일 </label>
				<input name="receiver" value="adoo9333@gmail.com" class="form-control" readonly="readonly"><br/>
			</div>			
			
			<div class="form-group">
				<label>제목</label>
				<input name="subject" class="form-control"><br/>
			</div>			
			
			<div class="form-group">
				<label>내용 </label>
				</br><textarea rows="5" cols="80" name="content" class="form-control"></textarea></br>
			</div>
				
			<div>			
				<button type="submit" class="btn btn-outline-primary" value="전송">전송</button>
			</div>
		</form>
		<span style="color:red;">${message}</span>
	</div>

	<div class="footer">
		<%@ include file = "./footer.jsp" %>
	</div>
</body>
</html>
