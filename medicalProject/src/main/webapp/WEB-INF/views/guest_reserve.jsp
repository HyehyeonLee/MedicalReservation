<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	#consult{
		float: right;
	    position: relative;
	    right: 70px;
	    top: 283px;
	    position: fixed;
	    right: 60px;
	    margin-top: 90px;
	    cursor:pointer;
	}
</style>
<meta charset="UTF-8">
<title>예약 정보 조회</title>
<script>
	$(function(){
		/* $(".reserveBtn").click(function(){
			var reserve_id = $(this).parent().find("#hospital_reserve_id").val();
			location.href = "${pageContext.request.contextPath}/reserveCommit?hospital_reserve_id="+reserve_id;
		}); */

		//날짜 선택 버튼 클릭시, ajax로 해당 날짜에 예약 가능한 시간을 가져온다.
		$(".dateBtn").click(function(){
			var selectedDate = $("select#date").val();
			var yadmNm = $("input#yadmNm").val();
			ajax_get_date(selectedDate, yadmNm);
		});

	});

	function ajax_get_date(selectedDate, yadmNm){
		var data = {
				date : selectedDate,
				name : yadmNm
				}
		$.ajax({
				url : '${pageContext.request.contextPath}/rest/dateSelect',
				type : 'post',
				data : JSON.stringify(data),
				dataType : 'json',
				contentType : 'application/json',
				success : function(response){
					list = response;
							$("#timeDiv").html("");
					for(var i = 0; i<list.length; i++){
							var str = "";	//가져온 시간들을 radio 버튼으로 출력한다.
							str += "<label><input type = 'radio' name='hospital_reserve_id' class = 'hospital_reserve_id' value='"+list[i].hospital_reserve_id+"'/>";
							str += list[i].time+"</label>";
							str += "<br />";
							$("#timeDiv").append(str);	
						}
					$('input:radio[name=hospital_reserve_id]').eq(0).attr("required", true);
					},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					alert('에러!');
					}
			});
		}
</script>
<style>
	#timeDiv{
		padding-top : 20px;
	}
</style>
</head>
<body>
<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
<div class="content">
<h1 class="sub-title">${yadmNm }의 예약 가능 정보입니다.</h1>
<h3 class="sub-title" style="padding-top : 0px;">내원 가능한 날짜와 시간을 선택해주세요.</h3>	
<form action="${pageContext.request.contextPath}/reserve/guestReserve" method="GET" id = "reserveForm">
<input type="hidden" name="yadmNm" class = "yadmNm"  id = "yadmNm" value = "${ yadmNm}"/>
<input type="hidden" name="hospital_id" value = "${ hospital_id}" />
<input type="hidden" name="guest_id" value="${dto.id }" />
<br />
	<select name="date" id="date" class="form-control" style = "width : 30%;" required>
		<option value="">날짜 선택해주세요</option>
		<c:forEach var = "dateList" items = "${dateList }">
			<option value="${dateList }">${dateList }</option>
		</c:forEach>
	</select>
	<br />
	<input type="button" value="날짜선택" class= "dateBtn btn btn-primary" id = "dateBtn"/>
	<div></div>
	<div id = "timeDiv">
		
	</div>

	<input type="submit" value="예약완료" class = "submitBtn btn btn-success" style="float : right;"/>
</form>
<div style="height : 50px;"></div>
		<!-- 상담 채팅 아이콘 -->
		<div class="chat-doot">
		<svg width="50px" height="50px" float="right" viewBox="0 0 16 16" id="consult" onclick="nwindow();" class="bi bi-chat-dots-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 		<path fill-rule="evenodd" d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		</svg>
	</div>
</div>
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>