<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 입력</title>
</head>
<body>
<div class="header">
	<%@ include file="./header.jsp"%>
</div>
<div class="content">
<h2 class="sub-title">예약 정보 입력</h2>
		<form action="${pageContext.request.contextPath }/reserve/ReserveInfo" method="post" style="width : 50%;">
			<input type="hidden" name="hospital_id" value="${dto.id }" /> <input
				type="date" name="date" id="date" class="form-control"/><br /> 
				<input type="time" name="time" id="time" class="form-control"/><br />
				<input type="submit" value="작성" class="btn btn-primary"/>
		</form>
	</div>
<div class="footer">
	<%@ include file="./footer.jsp"%>
</div>
</body>
</html>