<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath }/resources/css/index.css" rel="stylesheet" >
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<!-- 로그인전 페이지 -->
<c:if test="${empty dto.id && empty sessionId && empty kname}">
    <div class = "sub-menu">      
            <ul> 	         
                <li><a href="${pageContext.request.contextPath }/L_loginform">로그인</a></li>   
                <li><a href="${pageContext.request.contextPath }/join">회원가입</a></li>
            </ul>
        </div>
</c:if>   

<!-- 로그인 성공시 페이지 -->
<c:if test="${!empty dto.id}">
        <div class = "sub-menu">      
            <ul> 	
				<li>${dto.id }님 환영합니다</li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath }/mypage">마이페이지</a></li>           
              	 <%--  <li><a href="${pageContext.request.contextPath }/L_loginform">로그인</a></li>   
                <li><a href="${pageContext.request.contextPath }/J_joinform">회원가입</a></li>
                <button onclick="location.href='L_idsearch'">아이디찾기</button>
				<button onclick="location.href='L_pwsearch'">비밀번호찾기</button> 
				<form action="logout">
					<input type="submit" value="로그아웃"/>--%>
				
            </ul>
        </div>
</c:if>    

<c:if test="${!empty sessionId }">
        <div class = "sub-menu">      
            <ul>
				<li>${sessionId }님 환영합니다</li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>              
            </ul>
        </div>
</c:if> 

<c:if test="${!empty kname }">
        <div class = "sub-menu">      
            <ul> 	
            	<li>${kname }님 환영합니다</li>
            	<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>    
				
            </ul>
        </div>
</c:if> 
         <div class = "main-menu">
            <ul>
                <li>
                <a href="${pageContext.request.contextPath }/index" style="color : white !important;">
                <i class="fas fa-hospital" style="font-size : 50px"></i></a></li>
                <li><a href="${pageContext.request.contextPath }/supply/list">지원</a></li>
                <li><a href="#">뉴스</a></li>
                <li><a href="${pageContext.request.contextPath}/suggestionsEmail.do">건의사항</a></li>
            </ul>
        </div>
