<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    									<%@ include file="./include_file.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 조회</title>
<%@ include file="./header.jsp"%>
<script>
	$(function(){
		$(".reserveBtn").click(function(){
			var reserve_id = $(this).parent().find("#hospital_reserve_id").val();
			location.href = "${pageContext.request.contextPath}/reserveCommit?hospital_reserve_id="+reserve_id;
			//var id = $("#reserveBtn").prev().prev().prev().prev().val();
		});

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
							var str = "";
							str += "<input type = 'radio' name='hospital_reserve_id' value='"+list[i].hospital_reserve_id+"'/>";
							str += list[i].time;
							str += "<br />";
							$("#timeDiv").append(str);	
						}
					},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
					alert('에러!');
					}
			});
		}
</script>
</head>
<body>

<h1>${yadmNm }의 예약 가능 정보입니다.</h1>
<h3>내원 가능한 날짜와 시간을 선택해주세요</h3>	
<form action="${pageContext.request.contextPath}/reserve/guestReserve" method="GET" id = "reserveForm">
	<input type="hidden" name="yadmNm" class = "yadmNm"  id = "yadmNm" value = "${ yadmNm}"/>
	<select name="date" id="date">
		<c:forEach var = "dateList" items = "${dateList }">
			<option value="${dateList }">${dateList }</option>
		</c:forEach>
	</select>
	<input type="button" value="날짜선택" class= "dateBtn" id = "dateBtn"/>
	<div id = "timeDiv">
		
	</div>
	<br />
	<input type="submit" value="예약완료" />
</form>
</body>
</html>