<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>    
<style type="text/css">
   li {list-style: none; display:inline; padding: 6px; margin : 0px; font-size: 10px;}
   table {
   	border : 0;
   }
   table tr td a{
   	padding : 6px;
   	margin : 6px;
   }
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
              <table>
              	<tr>
              		<td><a href="${pageContext.request.contextPath }/list">목록</a></td>
              		<td><a href="${pageContext.request.contextPath }/writeView">글쓰기</a></td>
              	</tr>
              </table> 
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