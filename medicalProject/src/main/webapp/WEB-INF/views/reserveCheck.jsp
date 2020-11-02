<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="list" items="${dto }">
		${list.id }<br/>
		${list.name }<br/>
		${list.date }<br/>
		${list.time }<br/>
	
	</c:forEach>
	</body>
</html>