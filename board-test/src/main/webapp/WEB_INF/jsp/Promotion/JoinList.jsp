<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Benefit List</title>
</head> 
<body>
<div style="background: url(/img/background/joinList_bg.jpg) no-repeat 0 0; width: 100%;">



			
  	<div style="OVERFLOW-Y:auto; width:100%; height:150px;">
     <table class="table">
        <tr>
            <th>I  D </th>
            <th>이 름 </th>
        </tr>

     <c:forEach var="joinUser" items="${joinUsers}">
        <tr>
            <td>${joinUser.user_id}</td>
            <td>${joinUser.user_name}</td>
        </tr>
        </c:forEach>

	</table>
	
	</div>
</div>

</body>
</html>