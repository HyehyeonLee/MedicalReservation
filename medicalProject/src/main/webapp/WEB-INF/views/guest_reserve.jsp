<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include_file.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
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
<div class="header">
		<%@ include file="./header.jsp"%>
	</div>
<div class="content">
<h1>${yadmNm }의 예약 가능 정보입니다.</h1>
<h3>내원 가능한 날짜와 시간을 선택해주세요</h3>	
<form action="${pageContext.request.contextPath}/reserve/guestReserve" method="GET" id = "reserveForm">
<input type="hidden" name="yadmNm" class = "yadmNm"  id = "yadmNm" value = "${ yadmNm}"/>
<input type="hidden" name="hospital_id" value = "${ hospital_id}" />
	<select name="date" id="date">
		<c:forEach var = "dateList" items = "${dateList }">
			<option value="${dateList }">${dateList }</option>
		</c:forEach>
	</select>
	
	<input type="button" value="날짜선택" class= "dateBtn btn btn-primary" id = "dateBtn"/>
	
	<input type="hidden" name="guest_id" value="${dto.id }" />
	<div id = "timeDiv">
		
	</div>

	<input type="submit" value="예약완료" class = "submitBtn btn btn-success"/>
</form>
</div>
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
</body>
</html>