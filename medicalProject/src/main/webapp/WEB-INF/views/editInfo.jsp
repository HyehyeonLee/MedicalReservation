<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include_file.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<style>
#consult{
   float: right;
    position: relative;
    right: 70px;
    top: 283px;
    position: fixed;
    right: 67px;
    margin-top: 157px;
    cursor:pointer;
}

.sub-title {
   padding: 20px;
   color: #5c5c5c;
}

</style>
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
        
        if(document.getElementById('pw').value !='' && document.getElementById('pwchk').value!=''){
            if(document.getElementById('pw').value==document.getElementById('pwchk').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            }
            else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }
    }
    
</script>
<%
   String pwchange = (String)request.getAttribute("pwchange");
   String pwnotequal = (String)request.getAttribute("pwnotequal");
   String addresschange = (String)request.getAttribute("addresschange");
   
   String detailAddress = "abd";
try{
   detailAddress = (String)session.getAttribute("loginDetailAddress");
   //System.out.println("디테일"+detailAddress);
}catch(Exception e){
   //System.out.println("디테일"+detailAddress);
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

<h2 class="sub-title">회원 정보 수정</h2>
   <form action="${pageContext.request.contextPath}/editMypage" method="post" onsubmit = "return confirm('회원정보를 수정하시겠습니까?');" class="form" style="width : 60%;">
      <c:if test="${not empty dto.id && empty sessionId && empty kname }">
      아이디 : <input type="text" id="id" name="id" readonly="readonly" value="${editDto.id}" class="form-control"/><br/>
      </c:if>
      <c:if test="${empty dto.id && not empty sessionId && empty kname }">
      아이디 : <input type="text" id="id" name="id" readonly="readonly" value="${sessionNid}" class="form-control"/><br/>
      </c:if>
      <c:if test="${empty dto.id && empty sessionId && not empty kname }">
      아이디 : <input type="text" id="id" name="id" readonly="readonly" value="${sessionKid}" class="form-control"/><br/>
      </c:if>
      새로운 패스워드 :<input type="password" name="pw" id="pw" onchange="check_pw();"class="form-control"><br/>
      새로운 패스워드 확인 :<input type="password" id="pwchk" onchange="check_pw();" class="form-control" /><span id="check"></span><br/>
      <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-success"><br/>
      주소 :<input type="text" id="postcode" name="postcode" value="${editDto.postcode} "readonly="readonly" class="form-control"/>
      <input type="text" id="addr" name="addr" value="${editDto.addr}" readonly="readonly" class="form-control"/><br/>
      참고사항 :<input type="text" id="extraAddress" name="extraAddress" value="${editDto.extraAddress}" readonly="readonly" class="form-control"/><br/>
      상세주소 :<input type="text" id="detailAddress" name="detailAddress" value="${editDto.detailAddress}" class="form-control"><br/>
      <c:if test="${not empty dto.id && empty sessionId && empty kname }">
      이메일 :<input type="text" id="email" name="email" value="${editDto.email }" class="form-control"/><br/>
      </c:if>
      <c:if test="${empty dto.id && not empty sessionId && empty kname }">
      이메일 :<input type="text" id="email" name="email" value="${sessionEmail }" class="form-control"/><br/>
      </c:if>
      <c:if test="${empty dto.id && empty sessionId && not empty kemail }">
      이메일 :<input type="text" id="email" name="email" value="${sessionEmail }" class="form-control"/><br/>
      </c:if>
      휴대전화 :<input type="text" id="tel" name="tel" value="${editDto.tel}" class="form-control"/><br/>
      <input type="submit" value="수정" class="btn btn-primary">
   </form>

   <button type="submit" onclick="location.href='memberDeletePage'" class="btn btn-danger">회원탈퇴</button>
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