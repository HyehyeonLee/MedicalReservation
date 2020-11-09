<%@ page session="false" pageEncoding="utf-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="resources/css/joinCss.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<title>일반 회원 가입</title>
</head>
<body>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

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
        function fn_emailChk(){
			$.ajax({
				url : "emailCheckAction",
				type : "post",
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 이메일입니다.");
					}else if(data == 0){
						$("#emailChk").attr("value", "Y");
						alert("사용가능한 이메일입니다.");
					}
				}
			})
		}
    </script>
    
    <div class="header">
		<%@ include file="./header.jsp"%>
	</div>
	
    <div class="InputJoinInfo">
		<form action="insertAction" method="post">
		
			<div class="form-group" style="margin:200 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">아이디</label></br>
				<input type="text" id="id" name="id" class="form-control" style="width:300px; float:left;" required/>
				<button class="btn btn-outline-primary idCheck" type="button" id="idChk" onclick="fn_idChk();" value="N" style="float:left; font-size:11px;	">중복체크</button><br/>
			</div>
		
			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left;  margin:0;">비밀번호</label></br>
				<input type="password" id="pw" name="pw" onchange="check_pw()" class="form-control" style="width:300px; float:left;" required/><br/>
			</div>
			
			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">패스워드 확인</label></br>
				<input type="password" id="pw2" onchange="check_pw()" class="form-control" style="width:300px;float:left;" required /><span id="check"></span><br/>
			</div>

			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">이름</label></br>
				<input type="text" name="name" class="form-control" style="width:300px;float:left;" required/>
				<br/>
			</div>

			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">이메일</label></br>
				<input type="email" name="email" id = "email" class="form-control" style="width:300px;float:left;" required/>
				<button class="btn btn-outline-primary emailCheck" type="button" id="emailChk" onclick="fn_emailChk();" value="N" style="float:left; font-size:11px;">중복체크</button>
				<br/>
			</div>
			
			
			
			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">주소입력</label></br>	
				<input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" class="form-control" style="width:300px; float:left;" required>
		 		<button type="button" class="btn btn-outline-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="float:left; font-size:10px;" >우편번호 찾기</button><br/>
				<input type="text" id="addr" name="addr" placeholder="주소" readonly="readonly" class="form-control" style="width:300px; float:left;"><br/>
				<input type="text" id="extraAddress"name="extraAddress" placeholder="참고항목" readonly="readonly" class="form-control" style="width:300px; float:left;">
				<input type="text" id="detailAddress"name="detailAddress" placeholder="상세주소" class="form-control" style="width:300px; float:left;"><br />
			</div>

			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">휴대전화</label></br>
				<input type="text" name="tel" class="form-control" style="width:300px; float:left;" required/><br/>
			</div>
			
			<div class="form-group" style="margin:5 5 5 5; height:100px;">			
				<label style="float:left; margin:0;">생년월일 </label></br>
				<input type="date" name="birth" class="form-control" style="width:300px; float:left;" required/><br/>
				<input type="hidden" value="guest" name="grade"/>
			</div>
			
			<div class="welcomeJoin">
				<button class="btn btn-outline-primary" type="submit" value="회원가입 완료!" onclick="pw()" >회원가입 완료!</button>
			</div>
		</form>
	</div>
	
		
	<div class="footer">
		<%@ include file="./footer.jsp"%>
	</div>
	
	
	<style>
		html,body{
		}
		.InputJoinInfo{
			display: block;
			margin: 0 auto;
			margin-top: 50px; 
			width: 500px;
			height: 1250px;
		}
		
		.welcomeJoin{
			display: block;
			margin: 0 auto;
			width: 320px;
			height: 40px;
		}
				
	</style>
   
</body>
</html>









