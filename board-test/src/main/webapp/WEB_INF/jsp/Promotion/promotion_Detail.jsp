<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="true" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/PaperBootstrap.css" type="text/css">
   
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
	
	
</head>
<body>

 <div id="wrap" class="join">
    
	<div id="member_header">
			<!-- GNB -->
			<div id="gnb" >
				<h1><img src="/img/background/title_bg.png" width="250" height="60"  style="position: relative;"></h1>
				<h2 class="mem_info_title"> ${ownUser.user_name} 님의 Promotion</h2>
			</div>
			<!-- //GNB -->
		</div>
    
    <div id="member_cont_wrap" class="clfix">
    
					<h2>추천상품</h2>
		<div id="conts_section">
		      <div class="box_mem_info">
					
				<div style=" margin:auto; width: fit-content;padding: 20px;">
						<img src="/img/product/${promotion.product_code}.png" width="250" height="120" style="position: relative;margin: auto;">

						<h2><p style="color: #00b423; font-size: 23px; margin-top: 20px;">무제한듣기 + MP3 다운로드</p></h2>
					</div>
					
					<br>	
					
					
				    <div>
				    프로모션 아이디 : ${promotion.promo_id} <br>
				    주최자 아이디 : ${promotion.user_id}  <br>
				    주최자 이름 : ${ownUser.user_name}  <br>
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
					  <table class="table">
						   <tr>
							   <form action="/Promotion/JoinPromotion" method="post" onsubmit="return checkValue()">
							  		 <input type="hidden" name ="promoId" value="${promotion.promo_id}">
							  		 <input type="hidden" name ="productCode" value="${promotion.product_code}">
							  		 
									<td><input type="submit" href="#"  value="이벤트참여하기" class="btn btn-success"/></td>
									<td><input type="button" href="#" value="참여자확인하기 BT" onclick="fnPopup()" class="btn btn-default" /> </td>
				   			   </form>
						   </tr>
						  </table>
					 </div>
					 
					 <div class="bs-component">
				              <div class="progress">
				                <div class="progress-bar" style="width: 10%;">
				                </div>
				              </div>
				      </div>
				      
				      
      </div>
      </div>
      </div>
</div>
      
      
	 
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/javascript">
	
	
	   //이벤트주최가는 참여 불가 처리 
	   function checkValue(){
	       if( '${sessionScope.LoginUser.user_id}' == '${promotion.user_id}'){
	            alert("프로모션 주최자는 참여하실 수 없습니다." );
	            return false;
	        }
	    }
	  
	   function fnPopup() {
		    var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=400, top=200, width=440, height=550';
		    window.open("Detail/JoinList?promotion_id=${promotion.promo_id}", 'test', popupOption);
		}
	   
	</script>
	 
	
</body>
</html>