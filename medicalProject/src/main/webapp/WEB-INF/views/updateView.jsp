<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
	function UpdateOrCancel(){	
		$(document).ready(function() {
			var formObj = $("form[name='updateForm']");
			$(".cancel_btn").on("click", function() {
				event.preventDefault();
				location.href = "${pageContext.request.contextPath}/list";
//				   + "&page=${scri.page}"
//				   + "&perPageNum=${scri.perPageNum}"
//				   + "&searchType=${scri.searchType}"
//				   + "&keyword=${scri.keyword}";
			});
	
			$(".update_btn").on("click", function() {
				if (fn_valiChk() {
					return false;
				}
				formObj.attr("action", "${pageContext.request.contextPath}/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
	}
	
	
	
	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}

	$(document).ready(function() {
		$(".cancel_btn").on("click", function() {
			event.preventDefault();
		})
	})
	 
 		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$(document).on("click","#fileDelBtn", function(){
					console.log("fileAddBtn2")
					$(this).parent().remove();					
				});
			});
		}
	
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		
 		function fn_del(value, name){ 
						
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
 	 		alert("2");			
			
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

	<div class="navOutLine">
		<%@include file="nav.jsp" %>
	</div>

		<section id="container">
			<div class="outLine">
				<form name="updateForm" role="form" method="post"
					action="${pageContext.request.contextPath}/update"  enctype="multipart/form-data">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly" />
					<input type="hidden" id="page" name="page" value="${scri.page} ">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum} ">
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType} ">
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword} ">
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
					 
					<table>
						<tbody>
							<tr>
								<td><label for="title" class="label-control">제목</label><input type="text"
									id="title" name="title" value="${update.title}" class="form-control chk" title="제목을 입력하세요"/></td>
							</tr>
							<tr>
								<td><label for="content" class="label-control">내용</label> <textarea id="content"
										name="content" rows="10" cols="50" class="form-control chk" title="내용을 입력하세요" ><c:out value="${update.content}"/></textarea></td>
							</tr>
							<tr>
								<td><label for="writer">작성자</label><input type="text"
									id="writer" name="writer" value="${update.writer}"
									readonly="readonly" class="form-control chk" title="작성자를 입력하세요"/></td>
							</tr>
							<tr>
								<td><label for="reg_date">작성날짜</label><input type="text"
									id="reg_date" name="reg_date" class="form-control" value="${update.reg_date}"
									readonly="readonly" /></td>
							</tr>
							<tr>
								<td id="fileIndex">
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="file_no" name="file_no_${var.index}" value="${file.file_no }">
										<input type="hidden" id="file_name" name="file_name" value="file_no_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.org_file_name}</a>(${file.file_size}kb)
										<button id="fileDel" onclick="fn_del('${file.file_no}','file_no_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
								</td>							
							</tr>
						</tbody>
					</table>
					<div class="btn">
						<button type="submit" class="btn btn-outline-primary update_btn">저장</button>
						<button type="submit" class="btn btn-outline-primary cancel_btn">취소</button>
					</div>
				</div>
			</form>
		</section>
	</div>
	
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	
	
	<style>
		.outLine{
			display:block;
			margin:0 auto;
			width: 500px;
			height: 300px;
			margin-bottom:400px;
		}
		
		.navOutLine{
		
		}
		
		#root{
			margin-top:150px;
			margin-bottom:150px;
		}
	</style>
	
</body>
</html>