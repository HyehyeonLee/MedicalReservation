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
	#consult {
		float:right;
		right:-50px;
		position: absolute;
		height: 400px;
		top: 10px;
		cursor:pointer;
	}
	#scrollTop {
	    position: fixed;
	    right: 2%;
	    bottom: 50px;
	    display: none;
	    z-index: 999;
	    width:35px;
	    height:35px;
	    cursor:pointer;
	}



</style>
<script>
//상담버튼 따라다니게 하는 제이쿼리
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#consult").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#consult").stop().animate({
			"top" : newPosition
		}, 500);

	}).scroll();
});

//스크롤탑
	
	$(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#scrollTop').fadeIn();
            } else {
                $('#scrollTop').fadeOut();
            }
        });
         
        $("#scrollTop").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });








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
	<div class="chat-doot">
		<svg width="50px" height="50px" float="right" viewBox="0 0 16 16" id="consult" onclick="nwindow();" class="bi bi-chat-dots-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 		<path fill-rule="evenodd" d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		</svg>
	</div>
	<div class="scrolltop">
	<svg width="1em" height="1em" viewBox="0 0 16 16" id="scrollTop" class="bi bi-arrow-up-square-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 11.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
	</svg>
	</div>
</div>
	<div class="footer">	
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>