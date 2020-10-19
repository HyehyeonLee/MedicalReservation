<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="resources/css/joinCss.css" />" rel="stylesheet">
	<title>Home</title>
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
<script>
        function check_pw(){
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = 0;

            
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
            }
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = 1;
                }
            }
            if(check_SC == 0){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
                }
            
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value){
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
        }
        function fn_idChk(){
			$.ajax({
				url : "idCheckAction",
				type : "post",
				dataType : "json",
				data : {"id" : $("#id").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
    </script>
    
	<form action="insertAction">
		아이디 : <input type="text" id="id" name="id"/>
		<button class="idCheck" type="button" id="idChk" onclick="fn_idChk();" value="N">중복체크</button><br/>
		패스워드 : <input type="password" id="pw" name="pw" onchange="check_pw()"/><br/>
		패스워드 확인 :<input type="password" id="pw2" onchange="check_pw()"><span id="check"></span><br/>
		이름 : <input type="text" name="name"/><br/>
		주소입력 : <input type="text" id="postcode" name="postcode" placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br/>
		<input type="text" id="addr" name="addr" placeholder="주소"><br/>
		<input type="text" id="detailAddress"name="detailAddress" placeholder="상세주소">
		<input type="text" id="extraAddress"name="extraAddress" placeholder="참고항목"><br/>
		휴대전화 : <input type="text" name="tel"/><br/>
		생년월일 : <input type="text" name="birth"/><br/>
		이메일 : <input type="text" name="email"/><br/>
		<input type="hidden" value="guset" name="grade"/>
		<input type="submit" value="회원가입 완료!" onclick="pw()" />
	</form>
	 
	 <!-- 
	    <div class="wrap"    >
        <div class="menu">
            <h1 style="text-align: center;">MENU</h1>
        </div>
        <form class="insertAction">
            <p>
                <label for="id" name="id" id="id" > 아이디</label></br>
                <input type="text" name="id" id="id">
               <button class="idCheck" type="button" id="idChk" onclick="fn_idChk();" value="N">중복체크</button><br/>
            </p>
            <p>
                <label for="pw" name="pw" id="pw" >비밀번호</label></br>
                <input type="password" name="pw" id="pw">
            </p>
            <p>
                <label for="pw2" name="pw2" id="pw2" >비밀번호 확인</label></br>
                <input type="password" name="pw2" id="pw2">
            </p>
            <p>
                <label for="name" name="name" id="name" >이름</label></br>
                <input type="text" name="name" id="name">
            </p>
            <p>
		        주소입력 : <input type="text" id="postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br/>
				<input type="text" id="addr" name="addr" placeholder="주소"><br/>
				<input type="text" id="detailAddress"name="detailAddress" placeholder="상세주소">
				<input type="text" id="extraAddress"name="extraAddress" placeholder="참고항목"><br/>  
	        </p>
            <p>
                <label for="" id="phone">휴대전화</label></br>
                <select id="inputPhone" name="" style="float: left;">
                    <option value="" selected="selected">010</option>
                    <option value="">070</option>
                    <option value="">031</option>
                    <option value="">02</option>
                    
                </select>
                <input type="text" name="" id="inputPhone" style="float: left;">
                <input type="text" name="" id="inputPhone2" style="float: left;">
            </p>
            <p>
                <label for="birth" name="birth" id="birth" >생년원일</label></br>
                <input type="text" name="birth" id="birth">
            </p>
            <p>
                <label for="email" name="email" id="email" >이메일</label></br>
                <input type="text" name="email" id="email">
                @
                <select id="email2" name="" >
                    <option value="" selected="selected">- 메일선택 -</option>
                    <option value="">naver.com</option>
                    <option value="">gmallom</option>
                    <option value="">nate.om</option>
                    
                </select>

            </p>
            <div class="joinBtn" onclick="">
                <h3 style="text-align: center;">회원 가입</h3>
            </div>
        </form>
    </div>
 -->
</body>
</html>
