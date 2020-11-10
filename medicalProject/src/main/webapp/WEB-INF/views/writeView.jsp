<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시판</title>
</head>
<script type="text/javascript">   

   $(document).ready(function() {

      var formObj = $("form[name='writeForm']");

      $(".write_btn").on("click", function() {
         if (fn_valiChk()) {
            return false;
         }
            formObj.attr("action", "${pageContext.request.contextPath}/write");
            formObj.attr("method", "post");
            formObj.submit();
      });
   })
   
   function fn_valiChk() { // 작성버튼을 눌렀을 때 밸리데이션을 체크 
                     //클래스chk 의 i번째가 공백("")이거나 null이면 alert 로  i번째의 타이틀을 출력
                     // 간단하게 제목 , 내용 ,작성자(세션으로 받지 않을 경우) 가 비어있으면 alert(title)
         var regForm = $("form[name='writeForm'] .chk").length;
      for (var i = 0; i < regForm; i++) {
         if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
            alert($(".chk").eq(i).attr("title"));
            return true;
         }
      }
   }

</script>
<body>
   
   <div class="header">
      <%@ include file="./header.jsp"%>
   </div>


   <div id="root">
      <header>
         <h1 style="margin-left:30px;">게시판</h1>
      </header>
         <div style="margin-left:40px;">
            <%@include file="nav.jsp" %>
         </div>

      <section id="container">
         <div class="outLine">
         <form role="form" method="post" name=writeForm
            action="${pageContext.request.contextPath}/write" enctype="multipart/form-data">
            <table>
               <tbody>
                  <tr>
                     <td><label for="title" class="label-control">제목</label>
                     <input type="text" id="title" name="title" class="form-control chk" title="제목을 입력하세요"/></td>
                  </tr>
                  
                  <tr>
                     <td><label for="content" class="label-control">내용</label> <textarea id="content"
                        name="content" rows="10" cols="50" class="form-control chk" title="내용을 입력하세요" ></textarea></td>
                  </tr>
   
                  <tr>
                     <td><label for="writer" class="label-control">작성자</label><input type="text" value="${dto.id }"
                        id="writer" name="writer" class="form-control chk" title="작성자를 입력하세요" readonly="readonly"/></td>
                  </tr></br>
                  
                  <tr>
                     <td>
                        <input type="file" name="file" class="btn btn-outline-primary" >
                     </td>
                  </tr>
                  <tr>
                     <td id="fileIndex" />
                  </tr>
                  <tr>
                     <td>
                        <button class="btn btn-outline-primary write_btn" type="submit">작성</button>
                     </td>
                  </tr>
               </tbody>
            </table>
         </form>
      </section>
   </div>   
      <hr />

   <div class="footer">
      <%@ include file="./footer.jsp"%>
   </div>


   <style>
      .outLine{
         display:block;
         margin:0 auto;
         width: 500px;
         height: 700px;
      }
      
      #root{
         margin-top:150px;
         margin-bottom:150px;
      }
   
   </style>
   
</body>
</html>