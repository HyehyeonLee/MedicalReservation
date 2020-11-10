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
<c:if test="${empty dto.id && empty sessionId && empty kname}">		<!-- 일반로그인,네이버,카카오 로그인 정보가 null값일 때 -->
    <div class = "sub-menu">      
            <ul> 	         
                <li><a href="${pageContext.request.contextPath }/L_loginform">로그인</a></li>   
                <li><a href="${pageContext.request.contextPath }/join">회원가입</a></li>
            </ul>
        </div>
</c:if>   

<!-- 로그인 성공시 페이지 -->
<c:if test="${!empty dto.id}">				<!-- 일반로그인 정보가 담겨져있을 때 -->
        <div class = "sub-menu">      
            <ul> 	
				<li>${dto.id }님 환영합니다</li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃
				<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-door-open-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2v13h1V2.5a.5.5 0 0 0-.5-.5H11zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
</svg>
				</a></li>
				<li><a href="${pageContext.request.contextPath }/mypage">마이페이지
				<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-file-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
</svg>
				</a></li>           
              	 <%--  <li><a href="${pageContext.request.contextPath }/L_loginform">로그인</a></li>   
                <li><a href="${pageContext.request.contextPath }/J_joinform">회원가입</a></li>
                <button onclick="location.href='L_idsearch'">아이디찾기</button>
				<button onclick="location.href='L_pwsearch'">비밀번호찾기</button> 
				<form action="logout">
					<input type="submit" value="로그아웃"/>--%>
				
            </ul>
        </div>
</c:if>    

<c:if test="${!empty sessionId }">			<!-- 네이버로그인 정보가 담겨져있을 때 -->
        <div class = "sub-menu">      
            <ul>
				<li>${sessionId }님 환영합니다</li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃
				<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-door-open-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2v13h1V2.5a.5.5 0 0 0-.5-.5H11zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
</svg>
				</a></li>             
        <li><a href="${pageContext.request.contextPath }/mypage">마이페이지
				<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-file-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
</svg>
				</a></li>    
            </ul>
        </div>
</c:if> 

<c:if test="${!empty kname }">			<!-- 카카오톡 로그인 정보가 담겨져있을 때 -->
        <div class = "sub-menu">      
            <ul> 	
            	<li>${kname }님 환영합니다</li>
            	<li><a href="${pageContext.request.contextPath }/logout">로그아웃
				<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-door-open-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2v13h1V2.5a.5.5 0 0 0-.5-.5H11zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
</svg>
				</a></li> 
				
        <li><a href="${pageContext.request.contextPath }/mypage">마이페이지
			<svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-file-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
			</svg>
				</a></li>    
            </ul>
        </div>
</c:if> 
         <div class = "main-menu">
            <ul>
                <li>
                <a href="${pageContext.request.contextPath }/index" style="color : white !important;">
                <i class="fas fa-hospital" style="font-size : 50px"></i></a></li>
                <li><a href="${pageContext.request.contextPath }/supply/list">지원
                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-box-seam" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
</svg>
                </a></li>
                <li><a href="${pageContext.request.contextPath }/list">뉴스
                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-file-text" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z"/>
  <path fill-rule="evenodd" d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z"/>
</svg></a>
                </li>
                <li id="suggEmail"><a >건의
                <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
</svg>
                </a></li>
            </ul>
        </div>
<!-- 건의사항 제한 -->
        <c:choose>
	<c:when test="${empty dto.id && empty sessionId && empty kname}">
		<script>
			$(document).on('click','#suggEmail',function(){
				alert("로그인이 필요한 서비스입니다. 로그인 후 이용 부탁드립니다.");
			});
		</script>
	</c:when>
	<c:otherwise>
		<script>
			$(document).on('click','#suggEmail',function(){
				location.href="${pageContext.request.contextPath }/suggestionsEmail.do";
			});
		</script>
	</c:otherwise>
</c:choose>

<!-- 상담 제한 -->
<c:choose>
	<c:when test="${empty dto.id && empty sessionId && empty kname}">
	<script>
	$(document).on('click','#consult',function(){
		alert("로그인이 필요한 서비스입니다. 로그인 후 이용 부탁드립니다.");
	});
	</script>
	</c:when>
	<c:otherwise>
		<script>
		$(document).on('click','#consult',function(){
			window.open('/www/consultCustomer','window','width=500,height=400');
		}); 
		</script>
	</c:otherwise>
</c:choose>