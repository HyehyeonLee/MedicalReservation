<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LOGIN</title>
</head>
<body>

<center>
<c:choose>
<c:when test="${sessionId != null}">
	<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
	<h3>'${sessionId}' 님 환영합니다! </h3>
	<h3><a href="logout">로그아웃</a></h3>
</c:when>
<c:otherwise>
<form action="${pageContext.request.contextPath }/loginAction" method="post" name="frm" style="width:470px;">
	<h2>로그인</h2>
	<input type="text" name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}"> <br>
	<input type="password" id="pw" name="pw" class="w3-input w3-border" placeholder="비밀번호" > <br>
	<input type="submit" value="로그인"> <br>
	<c:if test="${msg=='fail' }">
		<script>
		alert("입력하신 아이디 혹은 비밀번호가 다릅니다.")
		</script>
	</c:if>
</form>
<br>
	<!-- 네이버 로그인 창으로 이동 -->
	<div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	<br>
	<div id="kakao_id_login" style="text-align: center"><a href="${kakao_url}"> 
		<img width="223" src="resources/img/kakao_login_medium_narrow.png" /></a> 
	</div>

</c:otherwise>
</c:choose>
</center>

<button onclick="location.href='L_idsearch'">아이디찾기</button>
<button onclick="location.href='L_pwsearch'">비밀번호찾기</button>

<!-- 
<form action="joinform">
	아이디 : <input type="text" name="id"><br/>
	패스워드 : <input type="password" name="pw"><br/>
	<input type="submit" value="로그인"><br/>
</form>
 -->
</body>
</html>