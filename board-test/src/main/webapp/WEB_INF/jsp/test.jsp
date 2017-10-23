<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>게시글 목록 : ${list}</h3>
    <div>
    
    프로모션 아이디 : ${promotion.promo_id}
    
    주최자 아이디 : ${promotion.user_id}
    
    주최자 이름 : ${ownUser.user_name}
    
    </div>
    
    
    
    <div>
     <table class="table">
        <tr>
            <th>목표인원 </th>
            <th>제공혜택 </th>
            <th>혜택단위 </th>
        </tr>

     <c:forEach var="benefit" items="${benefits}">
        <tr>
            <td>${benefit.goal_cnt}</td>
            <td>${benefit.offer}</td>
            <td>${benefit.unit}</td>
        </tr>
        </c:forEach>

	</table>
	</div>
	
	<input >
	
</body>
</html>