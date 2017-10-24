<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	.process{
		margin-bottom: 15px;
		background-image: url("/img/promo_process_bg.png");
		background-repeat: no-repeat
	}
</style>

</head>
<body>
	<div>
		<h2>님의 Promotion </h2>
	</div>
	
	<div>
		<img width="80" height="35" src="/img/term_img.png" alt=""> <p>2017.10.20 - 2017.10.25</p> 
	</div>
	<br>	
	
	<div class="process" width="950" height="180" >
	<h3>test</h3>
	</div>
	
	
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
	    	
	<div class="wrap_btn">
	  <table>
		   <tr>
			   <form action="/Promotion/JoinPromotion" method="post">
			  		 <input type="hidden" name ="promoId" value="${promotion.promo_id}">
			  		 <input type="hidden" name ="productCode" value="${promotion.product_code}">
			  		 
					<td><input type="submit" href="#"  value="이벤트참여하기" /></td>
					<td><input type="button" href="#" value="참여자확인하기" /></td>
   			   </form>
		   </tr>
		  </table>
	 </div>
	
	
</body>
</html>