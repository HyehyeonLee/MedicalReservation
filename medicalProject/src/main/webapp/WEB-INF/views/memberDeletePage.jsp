<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <title>회원탈퇴</title>
</head>
   <script type="text/javascript">
      $(document).ready(function(){
         // 취소
         $(".cencle").on("click", function(){
            
            location.href = "/";
                      
         })
      
         $("#submit").on("click", function(){
            if($("#userPass").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#userPass").focus();
               return false;
            }   
         });
         
            
         
      })
   </script>
   <body>
       
       <div class="header">
         <%@ include file="./header.jsp"%>
      </div>
   
      <section id="container">
         <form action="${pageContext.request.contextPath}/deleteAction" method="post">
            <div class="wrap">
               <div class="form-group has-feedback">
                  <label class="control-label" for="userId">아이디</label>
                  <input class="form-control" type="text" id="userId" name="id" value="${loginId}" style="width:400px" readonly="readonly"/>
               </div>
               <div class="form-group has-feedback">
                  <label class="control-label" for="userPass">패스워드</label>
                  <input class="form-control" type="password" id="userPass" style="width:400px" name="pw" />
               </div>
               
               <div class="form-group has-feedback">
                  <button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
                  <button class="cencle btn btn-danger" type="button">취소</button>               
               </div>
            </div>
         </form>
         <div>
            <c:if test="${msg == false}">
               비밀번호가 맞지 않습니다.
            </c:if>
         </div>
      </section>
      
      <div class="footer">
         <%@ include file="./footer.jsp"%>
      </div>
      
      
      <style>
         .wrap{
            display:block;
            margin:0 auto;
            margin-top:200px;
            width:430px;
            height:300px;
         }
      </style>
   </body>
</html>