<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>프로모션 어드민</title>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/base.css">
<link rel="stylesheet" type="text/css" href="/css/layout.css">
<link rel="stylesheet" type="text/css" href="/css/menu.css">
<link rel="stylesheet" type="text/css" href="/css/padm/cms.css">
<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.4.min.css">

<script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="/js/flatui-radio.js"></script>
<script type="text/javascript" src="/js/pager.js"></script>

<!-- bootstrap-table -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-table.css">
<script type="text/javascript" src="/js/bootstrap-table.js"></script>

<!-- x-editable (bootstrap 3) -->
<link rel="stylesheet" href="/css/bootstrap-editable.css">
<script type="text/javascript" src="/js/bootstrap-editable.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-table-editable.min.js"></script> 

<style type="text/css">
#wrap #container  {
    width: 95%;
    margin: auto;
}
body {
    font-size: 11px;
}
.table>thead>tr>th {
    vertical-align: TOP;
}

.tblDefault>tbody>td {
	border : none;
}
 </style>

<script type="text/javascript">
if(window.console==undefined){
	//override console (prevent ie error)
	var console = {log:function(){}};
}
</script>

</head>
<body>


<!--  Top Menu  -->

<div>
	 <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Admin Page</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Promotion 검색</a></li>
              <li><a href="#">Promotion 상세</a></li>
              <li><a href="#">참여현황 상세</a></li>
              <li class="dropdown open">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="../navbar-static-top/">로그아웃</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

</div>
<!--  End of Top Menu  -->



<div id="Container" style="padding: 30px;">
		<!-- 본문 내용 -->
		<!--<div id="contWrap">-->
		<div id="Contents">
		<h2>프로모션 상세</h2>
		<table summary="" class="tblDefault">
			<caption></caption>
			<colgroup>
				<col width="140px">
				<col width="340px">
				<col width="480px">
			</colgroup>
			<tbody class="al">
				<tr>
					<th scope="row"><label for="">프로모션 ID</label></th>
					<td colspan="3">${promotion.promoId}</td>
				</tr>
				<tr>
					<th scope="row"><label for="">생성 User</label></th>
					<td colspan="3" id="productInfo"> ${ownUser.user_id} (${ownUser.user_name}) </td>
				</tr>
				<tr>
					<th scope="row"><label for="">프로모션 기간</label></th>
					<td colspan="3">
					
						<input type="text" name="OPRTSTARTDT" id="date_start" size="20" readonly="" value="${promotion.createDate}" chk_rule="isEmpty" class="hasDatepicker">&nbsp;~&nbsp;
						<input type="text" name="OPRTENDDT" id="date_end" size="20" readonly="" value=" ${promotion.dueDate}" chk_rule="isEmpty" class="hasDatepicker">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">프로모션 유형</label></th>
					<td colspan="3">
						<c:choose>
							<c:when test="${promotion.promoType == '1'}" var="result">
		  							 다함께받기 <br>
		  					</c:when>
		  					<c:when test="${promotion.promoType == '2'}" var="result">
		  							 나혼자받기 <br>
		  					</c:when>Ω
	  					</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">혜택종류</label></th>
					<td colspan="3" id = "benefitCode">
						<c:choose>
							<c:when test="${promotion.benefitCode == '01'}" >
		  							 할인쿠폰 
		  					</c:when>
		  					<c:when test="${promotion.benefitCode == '02'}" >
		  							포인트적립 
		  					</c:when>
		  					
	  					</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">상세보상내역</label></th>
					<td colspan="3" id = "benefitInfo">
					 <div id  = "benefitDiv" style="padding: 5px;"></div>						
					</td>
				</tr>
				
				<tr>
					<th scope="row"><label for="">상품정보</label></th>
					<td colspan="3" id="productInfo"> ${product.product_name} </td>
				</tr>
				<tr>
					<th scope="row"><label for="">현재참여인원</label></th>
					<td colspan="3" id="productInfo"> 총 ${promotion.joinCnt} 명 참여중 <br>
					<div id ="participateDiv">
					
					</div>
					</td>
				</tr>
				
			</tbody>
		</table>

		<div class="btnC">
			<span class="btnType03" id="addButton" addtype="submit" formname="form1"><a>등록</a></span>
			<span class="btnType03" id="addButton" addtype="cancle" formname="form0"><a>취소</a></span>
		</div>

	</div>
		<!-- //contWrap-->

	</div>
	
	<script>
	
	$(document).ready(function () {
				//가져오기     
			    var benefits = ${benefits} 
			    
			    var benefit_list_html  = ''
			
			    $("#BenefitInfo").remove();
		        var benefit_list_html = '<table id="BenefitInfo">'
			    for (var i = 0; i < benefits.length; i++) {
		    	    		var obj = benefits[i];
			    	    		benefit_list_html += '<tr><td> <div class = "benefit_goal"> <span>' + obj.goal_cnt + '명 달성 시<span></div></td>'
						benefit_list_html += '<td><div class = "benefit_info">' +obj.offer + obj.unit +'</div></td></tr>';
			    }
		      	benefit_list_html += '</table>';
			    $("#benefitDiv").append(benefit_list_html);
			
			    var participates = ${participateList} 
			    
			    var participate_list_html  = ''
			    
			
			    $("#participatesInfo").remove();
		        var participate_list_html = '<table id="participatesInfo">'
		        	participate_list_html += '<tr>'
	    	    		participate_list_html += '<th>사용자ID</th><th>사용자이름</th><th>성별</th><th>나이</th><th>참여일시</th><th>유입경로</th> </td>'
		        
			    for (var i = 0; i < participates.length; i++) {
		    	    		var obj = participates[i];
		    	    		participate_list_html += '<tr>'
		    	    		participate_list_html += '<td> <div class = "benefit_goal"> <span>' + obj.userId + '<span></div></td>'
		    	    		participate_list_html += '<td><div class = "benefit_info">' +obj.userName +'</div></td>'
		    	    		if (obj.gerder == '1'){
		    	    			participate_list_html += '<td><div class = "benefit_info">남</div></td>'
		    	    		} else{
		    	    			participate_list_html += '<td><div class = "benefit_info">여</div></td>'
		    	    		}
		    	    		participate_list_html += '<td><div class = "benefit_info">' +obj.age +'</div></td>'
		    	    		participate_list_html += '<td><div class = "benefit_info">' +obj.joinDate +'</div></td>'
		    	    		participate_list_html += '<td><div class = "benefit_info">' +obj.joinFrom +'</div></td>'		    	    		
		    	    		participate_list_html += '</tr>';
			    }
	    	    		participate_list_html += '</table>';
			    $("#participateDiv").append(participate_list_html);
			    
			    
			    
			}
		)
	    
	</script>
	
	
	

</body>
</html>