<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<title>게시판</title>
<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}

.container{
			margin-top:150px;
 		}
 		
 	table{
 			border-spacing:10px;
 			border-collapse: separate;
 		}
 		
</style>
</head>
<body>
	<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	
	<div class="content">
		<header>
			<h1 class="sub-title">게시판</h1>
		</header>
			<div class="navPosition">
				<%@include file="nav.jsp" %>
			</div>

		<section id="container">
			<form role="form" method="get" class="table table-bover"
				action="${pageContext.request.contextPath}/write">
				<table>
					<tr>
						<td style="width:55px; text-align:center;">번호</td>
						<td style="width:800px; text-align:center;">제목</td>
						<td style="width:55px; text-align:center;">작성자</td>
						<td style="width:55px; text-align:center;">등록일</td>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td style="text-align:center;"><c:out value="${list.bno}" /></td>
							<td style="text-align:center;">
							<a href="${pageContext.request.contextPath}/readView?bno=${list.bno}&
										page=${scri.page}&
										perPageNum=${scri.perPageNum}&
										searchType=${scri.searchType}&
										keyword=${scri.keyword}"><c:out value="${list.title}"/></a>
							</td>
																				 				
							<td style="text-align:center;"><c:out value="${list.writer}" /></td>
							<td style="text-align:center;"><c:out value="${list.reg_date}" /></td>
						</tr>
					</c:forEach>

				</table>
				<div class="search row">
					<div class="col-xs-2 col-sm-2">
					<select name="searchType" class="form-control">
						  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
					      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>					
					 </select>
					</div>
					
					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
							 <span class="input-group-btn">
							    <button id="searchBtn" type="button" class="btn btn-default">검색</button>
  						     </span>
  						 </div>
  					</div>
  						     
				    <script>
				      function searching(){
				        $('#searchBtn').click(function() {
				          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				        });
				      }
				    </script>
				</div>
				<div>
					<ul style="height: 30px; margin: 10px 0 0 0; text-align: center;width: 300px;margin-left: auto;margin-right: auto;padding: 0;"`>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
			</section>
		<hr />
	</div>
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>