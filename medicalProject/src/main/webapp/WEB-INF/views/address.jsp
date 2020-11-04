<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty dto.id}">
        <div class = "sub-menu">      
            <ul> 	
				<li>${Adto.id }님 주소지를 확인해주세요</li>
				<li>${Adto.name }</li>
				<li>${Adto.addr }</li>
				<li>${Adto.detailAddress }</li>
				<li>${Adto.extraAddress }</li>
				<li>${Adto.tel }</li>
			
				<li><a href="${pageContext.request.contextPath }/index">메인</a></li>           
            </ul>
        </div>
</c:if>    
</body>
</html>