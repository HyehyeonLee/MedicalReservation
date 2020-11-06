<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="footer" style="">
	<div class="footer-content">
		<ul>
			<li class="listTitle">
				<div class="company">
					<!-- 고객센터<br /> <a href="#">공지사항</a><br /> <a href="#">이용약관</a><br /> <a
						href="#">개인정보처리방침</a> -->
					<span id="service" style="pointer;"><a >고객센터</a></span>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="">공지사항</a>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="">이용약관</a>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="">개인정보처리방침</a>
				</div>
			</li>
		</ul>
		<p class="copyright">Copyright © MedicalReservatoin Corp. All
			rights reserved</p>
	</div>
</footer>
<!-- 공지사항 제한 -->
<c:choose>
	<c:when test="${empty dto.id && empty sessionId && empty kname}">
		<script>
			$(document).on('click','#service',function(){
				alert("로그인이 필요한 서비스입니다. 로그인 후 이용 부탁드립니다.");
			});
		</script>
	</c:when>
	<c:otherwise>
		<script>
			$(document).on('click','#service',function(){
				location.href="${pageContext.request.contextPath }/suggestionsEmail.do";
			});
		</script>
	</c:otherwise>
</c:choose>
