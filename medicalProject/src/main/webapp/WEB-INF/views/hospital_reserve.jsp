<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/ReserveInfo" method="post">
		<input type="hidden" name="hospital_id" value = "myeongji" />
		<input type="date" name="date" id="date" /><br />
		<input type="time" name="time" id="time" /><br />
		<input type="submit" value="작성" />
	</form>
</body>
</html>