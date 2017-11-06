<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>프로모션 상세내역보기</title>
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
              <li class="dropdown">
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
		<table  class="tblDefault">
			<colgroup>
				<col width="140px">
				<col width="340px">
				<col width="480px">
			</colgroup>
			<tbody class="al">
				<tr>
					<th scope="row"><label for="">상품 기본 할인율</label></th>
					<td colspan="3">
					<input type="text" id="discountRate" size="5" value="" chk_rule="isEmpty" > 
					<p>* Percent단위로 입력해주세요 (ex 80 입력 시  -> 80% 할인 가격으로 적용)</p>
				</tr>
				<tr>
					<th scope="row"><label for="">프로모션 유형</label></th>
					<td colspan="3" id="productInfo">
                         <input type="radio" name="promo_type" value="1" checked>나혼자
                         <input type="radio" name="promo_type" value="2">다함께
                     </td>
				</tr>
				<tr>
					<th scope="row"><label for="">혜택 종류</label></th>
					<td colspan="3">
                         <input type="radio" name="benefit_code" value="01">할인쿠폰 
                         <input type="radio" name="benefit_code" value="02">포인트적립
                         <input type="radio" name="benefit_code" value="03" >캐시백
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="">혜택상세</label></th>
					<td colspan="3">	
					<div id="table1">
						<table id="dataTable"></table>
					</div>
					<p >* 클릭시 값 수정 가능</p>
				
					
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
	
<script type="text/javascript">

$(function() {
	
	$("#dataTable").bootstrapTable({
		method: "post",
	    url: "/test",
	    striped: true,
	    columns: [ {
	        field: "goal_cnt",
	        title: "달성인원",
	        align: "center",
	        sortable:true,
	        formatter : function(value, row, index) {
		        if (value != null) {
		        		return '<a href="javascript:void(0)" data-name="name" data-pk="2" data-value="'
		        				+value+
		        				'"class="editable editable-click editable-unsaved" data-original-title="" title=""'
		        				+'style="background-color: rgba(0, 0, 0, 0);">' + value
		        }
				}
	    }, {
	        field: "offer",
	        title: "혜택내용",
	        align: "center",
	    }, ],
       onLoadSuccess: function (jsonData) {
       	$("#dataTable").css("font-size", "10px");
       	$("a[data-name='OFFERID']").hide();
       }
	});
});
</script>	
	
	
<script>
	$(document).ready(function () {
		$("input:radio[name=promo_type]").click(function() { 
			var benefit_code  =  $("input[name=benefit_code]:checked").val()
			if (benefit_code != ''){
						alert('benefit_code is not blank')
						getBenefit()
			}
	  }) ;
		
	  $("input:radio[name=benefit_code]").click(function() { 
			var promo_type =  $("input[name=promo_type]:checked").val()
			if (promo_type != ''){
				alert('promo_type is not blank')
				getBenefit()
			}
	  });
				    
				    
	  function getBenefit(){
		 $.ajax({
				url : '/getBenefitList',
				type : "GET",
				async : false,
				data : {  "promo_type" :  $("input[name=promo_type]:checked").val(),
						 "benefit_code" :  $("input[name=benefit_code]:checked").val() },	
				success : function(jsonData) {
					if ( jsonData.result == false ) {
					$("#dataTable").bootstrapTable("refresh");				
					} else {
						$("#dataTable").bootstrapTable("load", jsonData);
					}
							
					$('div.has-error').removeClass('has-error');
				}
			}); 
		}	
})
</script>
	
	
	

</body>
</html>