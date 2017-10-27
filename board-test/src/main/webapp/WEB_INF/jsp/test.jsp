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
     <table>
		   <tr>
   					<td>
                        <input type="radio" name="gender" value="1" checked>나혼자
                        <input type="radio" name=""gender"" value="2">다함께
                    </td>
                  	  
                  	  
                  	  </tr>
                  	  <tr>
                    
                    
                    <td>
                        <input type="radio" name="radio2" value="1" checked>radio2
                        <input type="radio" name="radio2" value="2">radio2-1
                    </td>
	</tr>
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
	 
	 
	 <script type="text/javascript">
		 $('input:radio[name=promo_type]').click(function() {
		    
	    	
	   	 	alert('tt');
			var i = $('input:radio[name=promo_type]').index(this);
			alert('!!! test' + i)
			

			
		});
	    
	 
	    $('input:radio[name=radio2]').click(function() {
			var i = $('input:radio[name=radio2]').index(this);
			alert('!!! radio2radio2radio2 test' + i)
		});
	 
	 </script>
	
</body>
</html>