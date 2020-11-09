<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>LOGIN</title>
</head>
<body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<<<<<<< HEAD
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

	<%if(request.getAttribute("message")!=null){ %>
			 	<script>alert("회원가입이 성공적으로 되었습니다! 다시 로그인 해주세요.");</script>
			 <%} %>
	 
	 
	 <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
			 
	<div class="outLine">		 
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
						
						<div class="form-group">
							<input type="text" class="form-control"  name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}">
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control" id="pw" name="pw" class="w3-input w3-border" placeholder="비밀번호" > <br>
						</div>
						<div class=""></div>
							<button class="btn btn-outline-primary" type="submit" value="로그인" style="font-size:13px;">로그인<br>
						<c:if test="${msg=='fail' }">
							<script>
							alert("입력하신 아이디 혹은 비밀번호가 다릅니다.");
							</script>
						</c:if>
							<button class="btn btn-outline-primary" style="font-size:13px; margin-left:5px;" onclick="location.href='L_idsearch'">아이디찾기</button>
							<button class="btn btn-outline-primary" style="font-size:13px; margin-left:5px;" onclick="location.href='L_pwsearch'">비밀번호찾기</button>
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
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	
	<style>
		.outLine{
			margin:200px 0 0 0;
			height:700px;
		}
		
		.form-control{
			width: 300px;
		}
	</style>	
=======
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
>>>>>>> branch 'main' of https://github.com/HyehyeonLee/MedicalReservation.git

<<<<<<< HEAD
=======
   <%if(request.getAttribute("message")!=null){ %>
             <script>alert("회원가입이 성공적으로 되었습니다! 다시 로그인 해주세요.");</script>
          <%} %>
    
    
    <div class="header">
      <%@ include file="./header.jsp"%>
   </div>
          
   <div class="outLine">       
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
                  
                  <div class="form-group">
                     <input type="text" class="form-control"  name="id" id="id" class="w3-input w3-border" placeholder="아이디" value="${id}">
                  </div>
                  
                  <div class="form-group">
                     <input type="password" class="form-control" id="pw" name="pw" class="w3-input w3-border" placeholder="비밀번호" > <br>
                  </div>
                  <div class=""></div>
                     <button class="btn btn-outline-primary" type="submit" value="로그인" style="font-size:13px;">로그인<br>
                  <c:if test="${msg=='fail' }">
                     <script>
                     alert("입력하신 아이디 혹은 비밀번호가 다릅니다.");
                     </script>
                  </c:if>
                     <button class="btn btn-outline-primary" style="font-size:13px; margin-left:5px;" onclick="location.href='L_idsearch'">아이디찾기</button>
                     <button class="btn btn-outline-primary" style="font-size:13px; margin-left:5px;" onclick="location.href='L_pwsearch'">비밀번호찾기</button>
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
   </div>
   
   <div class="footer">
      <%@ include file="./footer.jsp"%>
   </div>
   
   <style>
      .outLine{
         margin:200px 0 0 0;
         height:700px;
      }
      
      .form-control{
         width: 300px;
      }
   </style>   

>>>>>>> branch 'main' of https://github.com/HyehyeonLee/MedicalReservation.git
</body>
</html>