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
    <h3>게시글 목록 : ${list}</h3>
    
     <table class="table">
        <tr>
            <th>목표인원 </th>
            <th>제공혜택 </th>
            <th>혜택단위 </th>
        </tr>

     <c:forEach var="benefit" items="${list}">
        <tr>
            <td>${benefit.goal_cnt}</td>
            <td>${benefit.offer}</td>
            <td>${benefit.unit}</td>
        </tr>
        </c:forEach>

	</table>

</body>
</html>