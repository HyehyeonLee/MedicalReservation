<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<%
	String pwchange = (String)request.getAttribute("pwchange");
	String pwnotequal = (String)request.getAttribute("pwnotequal");
	String addresschange = (String)request.getAttribute("addresschange");
	
	String detailAddress = "abd";
try{
	detailAddress = (String)session.getAttribute("loginDetailAddress");
	System.out.println(detailAddress);
}catch(Exception e){
	System.out.println(detailAddress);
}
	
	
	if("mode".equals("pwchange")){
%>
	<script>alert("비밀번호가 변경되었습니다!");</script>
<%		
	}else if("mode".equals("pwnotequal")){
%>
	<script>alert("비밀번호가 일치하지않습니다! 다시해주세요!");</script>
<%	
	}else if("mode".equals("addresschange")){
%>
	<script>alert("주소가 변경되었습니다!");</script>
<%		
	}
%>
<div class="header">
		<%@ include file="./header.jsp"%>
</div>
<div class="content">


<form action="${pageContext.request.contextPath}/editPass" method="post" onsubmit = "return confirm('회원정보를 수정하시겠습니까?');">
	아이디 : <input type="text" id="id" name="id" readonly="readonly" value="${dto.id}"/><br/>
	새로운 패스워드 :<input type="password" name="pw" required = ""><br/>
	새로운 패스워드 확인 :<input type="password" name="pwchk" required = "" /><br/>
	주소 :<input type="text" id="postcode" name="postcode" value="${dto.postcode} "readonly="readonly"/>
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br/>
	<input type="text" id="addr" name="addr" value="${dto.addr}" readonly="readonly"/><br/>
	상세주소 :<input type="text" id="detailAddress" name="detailAddress" value="${dto.detailAddress}" ><br/>
	참고사항 :<input type="text" id="extraAddress" name="extraAddress" value="${dto.extraAddress}" readonly="readonly"/><br/>
	이메일 :<input type="text" id="email" name="email" value="${dto.email }"/><br/>
	휴대전화 :<input type="text" id="tel" name="tel" value="${dto.tel}"/><br/>
	<input type="submit" value="수정">
</form>

	<button type="submit" onclick="location.href='memberDeletePage'">회원탈퇴</button>
</div>
<div class="footer">
		<%@ include file="./footer.jsp"%>
</div>
</body>
</html>