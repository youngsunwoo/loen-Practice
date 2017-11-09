<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>this is jsp index file</h3>


<br>
<h3> 세션확인! </h3>
<div>
        이름 : ${sessionScope.LoginUser.user_name}
 		<br>
        나이  : ${sessionScope.LoginUser.age} 
</div>


<h3> 세션확인! </h3>
<div>
        이름 : ${sessionScope.LoginAdmin.user_name}
 		<br>
        나이  : ${sessionScope.LoginAdmin.age} 
</div>
		<a href="/Promotion/FormNewPromotion">프로모션 이벤트생성하기</a>
</body>
</html>