<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
		function search(){
			if((pwsearch.id.value!=null)&&(pwsearch.email.value!=null)){
				pwsearch.submit();
			}else if(pwsearch.id.value==null) {
				alert("아이디를 입력하세요.")
			}else if(pwsearch.email.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}function showMsg(m){
			
			if(m==0){
				
			}else if(m==1){
				alert("입력하신 정보가 등록하신 정보와 다릅니다.");
				window.open("searchpw.do","_self", "" );
			}
		}function login(){
			window.open("login.do","_self","");
		}
	
</script>
<form action="sendpw.do" name="pwsearch" method="post">
	<input type="text" name="id" placeholder="아이디"/><br/>
	<input type="text" name="email" placeholder="이메일"/><br/>
	<button type="submit" onclick="search()">비밀번호 찾기</button>
</form>	
</body>
</html>