<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$(".bxslider").bxSlider({
			auto : true, //자동으로 애니메이션 시작
			speed : 500, //애니메이션 속도
			pause : 3000, //애니메이션 유지 시간 (1000이 1초)
			mode : "horizontal", // 슬라이드 모드
			pager : true, //페이지 표시 보여짐
		});
});
</script>
</head>
<body>
 <div class="slider">
    <ul class="bxslider">
    	<li><img src="${pageContext.request.contextPath }/resources/img/slider02.jpg" alt="" /></li>
    	<li><img src="${pageContext.request.contextPath }/resources/img/slider01.jpg" alt="" /></li>
    	<li><img src="${pageContext.request.contextPath }/resources/img/slider05.jpg" alt="" /></li>
    	<li><img src="${pageContext.request.contextPath }/resources/img/slider03.jpg" alt="" /></li>
    </ul>
  </div>
</body>
</html>