<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기관 회원 페이지</title>
</head>
<body>
<h1>기관 회원 페이지</h1>
<div class="header">
	<%@ include file="./header.jsp"%>
</div>
<div class="content">
	<div style="margin-left:90px; margin-top:160px;">
			<ul>
				<svg width="7em" height="7em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
		  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
		</svg>
				<li><a href="${pageContext.request.contextPath }/reserve/admin?id=${dto.id}" target="_blank">예약 정보 조회</a></li>
			</ul>
			
			<ul>	
				<svg width="7em" height="7em" style="margin-left:338px; margin-top:-157px;" viewBox="0 0 16 16" class="bi bi-calendar-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
		  <path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
		</svg>
				<li style="margin-left:350px; margin-top:-37px;"><a href="${pageContext.request.contextPath }/reserve/InsertReserveInfo" target="_blank">예약 정보 등록</a></li>
			</ul>
			<ul>	
				<svg width="7em" height="7em" style="margin-left:690px; margin-top:-170px;" viewBox="0 0 16 16" class="bi bi-chat" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			  <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
			</svg>
				<li style="margin-left:700px; margin-top:-55px;"><a href="${pageContext.request.contextPath }/consultAdmin" target="_blank">실시간 상담</a></li>
			</ul>	
	</div>		
</div>
<div class="footer">
	<%@ include file="./footer.jsp"%>
</div>
</body>
</html>