<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3a451e93a63b4d7a44c80b380b0b8713"></script>
<style>
	.search_div{
		padding-top : 50px;
	}
	
	#search_form{
		width : 80%; 
		margin : 0 auto;
	}
	
	#search_option{
		width : 20%;
	}
	
	#keyword{
		width : 70%;
	}
	
	.inform{
		width : 80%;
		padding : 50px;
		margin : 0 auto;
	}
	
	.inform p:nth-child(2n-1){
		color : #545454;
		font-size: 30px;
		text-align: center;
	}
	
	.inform p:nth-child(2n){
		color : #545454;
		font-size: 20px;
		text-align: center;
	}
	
</style>
<script>
	$(function(){
		var input_option = '${search_option}'; //이전 페이지에서 선택한 검색 옵션을 세팅
		if(input_option == "all"){
			$("#all").attr("selected", "selected");
		}else if(input_option == "A0"){
			$("#A0").attr("selected", "selected");
		}else if(input_option == "97"){
			$("#97").attr("selected", "selected");
		}else if(input_option == "99"){
			$("#99").attr("selected", "selected");
		}
	
		$(".reserveBtn").click(function(){
			<% if(session.getAttribute("dto") != null || session.getAttribute("sessionId") != null || session.getAttribute("kname")!=null) { %> 
				var yadmNm = $(this).parent().parent().find("input#yadmNm").val();
				location.href = "${pageContext.request.contextPath }/reserve/reserveList?yadmNm="+yadmNm;
			<% } else { %>
				alert("로그인이 필요합니다");
				location.href = "${pageContext.request.contextPath }/L_loginform";
			<% } %>
		});
		
		});
	
</script>
</head>
<body>
<div class="header">
		<%@ include file="./header.jsp"%>
</div>
<div class="content">


	<div class = "search_div"></div>
	<form action="./filter" method="get" id="search_form" class= "form-inline">
			<select name="spclAdmTyCd" class="form-control" id = "search_option">
				<option value="all" id="all">전체</option>
				<option value="A0" id="A0">국민안심병원</option>
				<option value="97" id="97">코로나검사 실시기관</option>
				<option value="99" id="99">코로나 선별진료소 운영기관</option>
			</select>&nbsp;&nbsp;
			<input type="text" name="keyword" id="keyword" class="form-control" value = "${keyword }"/>&nbsp;&nbsp;
			<input type="submit" value="검색" class = "btn btn-primary"/>
	</form>
	<br />
	<c:choose>
		<c:when test = "${empty list }"><!-- 검색 결과가 없을 시 -->
		<div class = "inform">
			<p class = "">"${keyword }"에 대한 검색 결과가 없습니다. 다시 입력해주세요.</p>
			<p>ex) "OO" → "OO시/군/구"로 바꾸어 입력.</p>				
		</div>
		</c:when>
		
		<c:otherwise>
			
		
	<table class = "table table-hover" style = "width : 80%; margin : 0 auto;">
	<tr>
		<th>번호</th>
		<th>주소</th>
		<th>기관명</th>
		<th>전화번호</th>
		<th>예약</th>
	</tr>
	<% int i = 1; %>
	<c:forEach var = "item" items = "${list }">
		<tr>
			<td><%=i++ %></td>
			<td><c:out value = "${item.addr }" /></td><!-- onclick="window.open(this.href, '', 'width=500, height=500'); return false;" -->
			<td><a href="https://map.kakao.com/link/search/${item.addr } ${item.yadmNm }" target="_blank"><c:out value = "${item.yadmNm }"/></a></td>
			<td><a href="tel:${item.telno }"><c:out value = "${item.telno }"/></a>
				<input type="hidden" class="yadmNm" id="yadmNm" value="${item.yadmNm }">
			</td>
			<c:choose>
				<c:when test="${item.reserve == 1}"><!-- 사이트에 가입한 병원만 예약 가능 -->
					<td><input type="button" id="reserveBtn" value="예약가능" class="reserveBtn btn btn-primary" /></td>
				</c:when>
				<c:when test="${item.reserve == 0}">
					<td><input type="button" id="reserveBtn" value="예약불가" class="btn btn-secondary" /></td>				
				</c:when>
			</c:choose>
		</tr>
		</c:forEach>
</table>

</c:otherwise>
	</c:choose>
</div>
	<div class="footer">	
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>