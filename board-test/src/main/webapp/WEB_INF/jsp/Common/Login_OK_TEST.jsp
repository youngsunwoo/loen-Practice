
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<html>
<head>
<title>Session 사용</title>
</head>
<body>



<%
 	//response.sendRedirect("http://www.melon.com");
%>

<!-- 
<script type="text/javascript">

window.onload = popupOpen
function popupOpen(){
	var popUrl = "/index.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
 -->
 
<h2>Session 사용</h2>
<p>세션 이름 : <b>${sessionScope.userLoginInfo.user_name}</b></p>
<P>페이지 상단에 <%@ page session="true" %> 선언함</P>

		  <h2>로그인 성공 </h2>
        이름 : ${sessionScope.userLoginInfo.user_name}
 		<br>
        나이  : <c:out value="${sessionScope.userLoginInfo.age}"/> 
        <a href="logout">로그아웃</a>
        <a href="page1">페이지1</a>  <a href="page2">페이지2</a>

</body>

</html>