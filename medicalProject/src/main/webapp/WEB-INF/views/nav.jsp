<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navOutLine">
		<a href="${pageContext.request.contextPath}/list" style="font-size:20px;">목록 /</a>
		<a href="${pageContext.request.contextPath}/writeView" style="font-size:20px;">글작성</a>
	</div>
	
	<style>
		.navOutLine{
			    width: 130px;
			    height: 30px;
			    margin-left: 15px;
			}
	</style>
</body>
</html>