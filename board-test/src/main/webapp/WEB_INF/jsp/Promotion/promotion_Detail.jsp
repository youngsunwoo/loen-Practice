<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="true" %>
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

.step {
    text-align: center;
}

 .step .col-md-2 {
     background-color: #fff;
     border: 1px solid #C0C0C0;
     border-right: none;
 }

.step .col-md-2:last-child {
    border: 1px solid #C0C0C0;
}

.step .col-md-2:first-child {
    border-radius: 5px 0 0 5px;
}

.step .col-md-2:last-child {
    border-radius: 0 5px 5px 0;
}

.step .col-md-2:hover {
    color: #F58723;
    cursor: pointer;
}

.step .activestep {
    color: #F58723;
    height: 100px;
    margin-top: -7px;
    padding-top: 7px;
    border-left: 6px solid #5CB85C !important;
    border-right: 6px solid #5CB85C !important;
    border-top: 3px solid #5CB85C !important;
    border-bottom: 3px solid #5CB85C !important;
    vertical-align: central;
}

.step .fa {
    padding-top: 15px;
    font-size: 40px;
}=
</style>

<link rel="stylesheet" href="/PaperBootstrap.css" type="text/css">
   

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
	 
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script type="text/javascript">
	
	
	   //데이터 넘기기전 필수 입력정보 혜택 / 상품코드가 제대로 선택되었는지 확인 
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