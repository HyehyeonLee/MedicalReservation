<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>    
<style type="text/css">
   li {list-style: none; display:inline; padding: 6px;}
</style>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function goToLoginPage() {
   alert("로그인이 필요한 서비스입니다. 로그인 후 이용 부탁드립니다.");
   //location.href="${pageContext.request.contextPath }/L_loginform";
}   
</script>
</head>
<body>
   <div class="navOutLine">
      <!-- 로그인전 페이지 -->
      <c:if test="${empty dto.id && empty sessionId && empty kname}">      <!-- 일반로그인,네이버,카카오 로그인 정보가 null값일 때 -->
          <div class = "">      
                  <ul>             
                      <a href="${pageContext.request.contextPath }/list">목록</a>
                  </ul>
              </div>
      </c:if>   
      
      <!-- 로그인 성공시 페이지 -->
      <c:if test="${!empty dto.id}">            <!-- 일반로그인 정보가 담겨져있을 때 -->
              <div class ="">      
                  <ul>    
                  <a href="${pageContext.request.contextPath }/logout">목록/
                  <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-door-open-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2v13h1V2.5a.5.5 0 0 0-.5-.5H11zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
      </svg>
                  </a>
                  <li><a href="${pageContext.request.contextPath }/writeView">글쓰기
                  <svg width="1.2em" height="1.2em" viewBox="0 0 16 16" class="bi bi-file-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
      </svg>
                  </a>           
                  </ul>
              </div>
      </c:if>    
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