<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
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
 </style>

<script type="text/javascript">
if(window.console==undefined){
	//override console (prevent ie error)
	var console = {log:function(){}};
}
</script>

<title>Insert title here</title>
</head>
<body>


<div id="wrap">

<form name="form0" id="form0" action="/padm/promotion/web/promotionmanagement_list.htm" method="post">
			<!-- 검색 -->
				<table summary="" class="tblDefault" style="border: 0; border-color: white;">
				<tbody><tr>
					<td style="text-align: left;">&nbsp;
						기간 : <input type="text" name="oprtStartDt" id="date_start" value="" size="10" readonly="" class="hasDatepicker">
							   &nbsp;~&nbsp;
							  <input type="text" name="oprtEndDt" id="date_end" value="" size="10" readonly="" class="hasDatepicker">&nbsp;

						구분 : <select id="promoGubunCode" name="promoGubunCode">
								<option value="">전체</option>
								
									<option value="9G0001">상품프로모션</option>
								
									<option value="9G0003">POC프로모션</option>
								
									<option value="9G0004">서비스프로모션</option>
								
									<option value="9G0007">VOC 대응</option>
								
									<option value="9G0008">이용권 매대 프로모션</option>
								
							  </select>&nbsp;

						상태 : <select id="promoStausCode" name="promoStausCode">
								<option value="">전체</option>
								
									<option value="9H0001">대기</option>
								
									<option value="9H0002">진행중</option>
								
									<option value="9H0003">종료</option>
								
							  </select>&nbsp;
						프로모션ID : <input type="text" id="promoId" name="promoId" value="" size="10" title="">&nbsp;
						캠페인ID : <input type="text" id="campnId" name="campnId" value="" size="10" title="">&nbsp;
						프로모션그룹ID : <input type="text" id="groupId" name="groupId" value="54" size="10" title="">&nbsp;
						Seg : <select id="segmtCode" name="segmtCode">
								<option value="">전체</option>
								
									<option value="1">1</option>
								
							 </select>
							 <span class="btnType02" id="addButton" addtype="submit" formname="form0"><a>검색</a></span>
					</td>
				</tr>
			</tbody></table>
</form>
		
	<div id="Container">
		<h4>그룹 리스트</h4>
		<div class="panel panel-default">
			<form class="form-horizontal" method="post" name="mlbForm">
				<div class="panel-body">
					<div class="col-sm-2">
						<select class="form-control" id="promoType" name="promoType">
							<option value="0 selected="">전체유형</option>
							<option value="1" >다함께받기</option>
							<option value="2">나혼자받기</option>
						</select>
					</div>					
					<div class="col-sm-2">
						<select class="form-control" id="benefitCode" name="benefitCode">
							<option value="00" selected="">전체혜택</option>
							<option value="01">할인쿠폰</option>
							<option value="02">포인트적립</option>
							<option value="03">캐시백</option>
						</select>
					</div>
					
					<div class="col-sm-2">
						<div class="input-group input-daterange" data-provide="datepicker">
							<div class="input-group date">
								<input type="text" class="form-control hasDatepicker" placeholder="생성일자" id="search_dispStartDate" name="dispStartDate">
								<span class="input-group-addon">
				                        <span class="glyphicon glyphicon-calendar"></span>
				                    </span>
							</div>
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="sr-only" for="groupId">그룹 아이디</label>
						<input type="text" class="form-control" name="groupId" id="groupId" placeholder="그룹 아이디">
					</div>
					<div class="col-sm-2">
						<label class="sr-only" for="groupName">그룹명</label>
						<input type="text" class="form-control" name="groupName" id="groupName" placeholder="그룹명">
					</div>
	
					<button type="button" id="searchBtn" data-loading-text="조회 중" class="btn btn-primary" autocomplete="off" style="margin-right: 20px;">
						<span class="glyphicon glyphicon-search"></span>조회
					</button>
					
					<button type="button" id="addBtn" data-loading-text="추가 중" class="btn btn-primary" autocomplete="off" style="margin-right: 20px;">
						<span class="glyphicon glyphicon-plus-sign"></span>추가
					</button>
				</div>
			</form>
		</div>
	</div>
	
	<div style="margin-top:5px;">
		<div id="table1">
			<table id="dataTable"></table>
		</div>
	</div>
	
</div>

<script type="text/javascript">
$(document).ready(function(){

});

$(function() {
	$("#dataTable").bootstrapTable({
		method: "post",
	    url: "/test",
	    striped: true,
		pagination: true,
		pageSize: 20,
		pageList: [20, 50, 100, 500],
	    columns: [{
	        field: "promoId",
	        title: "프로모션 아이디",
	        align: "center",
	        sortable:true,
	        formatter : function(value, row, index) {
	        if (value != null) {
	        		return "<a href='/Admin/Promotion/Detail?promotion_id="+value+"'>"+value+"</a>";	
	        }
			}
	    }, {
	        field:"promoType",
	        title: "유형",
	        align: "center",
	        sortable:true,
	        formatter : function(value) {
	        		if (value == "1"){
	        			return "다함께"
	        		}else{
	        			return "나혼자" 
	        		}
	        		
			}
	    }, {
	        field: "benefitCode",
	        title: "혜택",
	        align: "center",
	    }, {
	        field: "userId",
	        title: "등록자 아이디",
	        align: "center",
	    }, {
	        field: "productCode",
	        title: "상품아이디",
	        align: "center",
	    }, {
	    	field: "createDate",
	        title: "생성일자",
	        align: 'center',
	        sortable:true,
	    }, {
	    	field: "createDate",
	        title: "참여인원",
	        align: 'center',
	        sortable:true,
	    },],
       onLoadSuccess: function (jsonData) {
       	$("#dataTable").css("font-size", "10px");
       	$("a[data-name='OFFERID']").hide();
       }
	});
});
</script>

<script type="text/javascript">
$("#searchBtn").on("click", function(e) {
	search(); 
});



function search() {
    $.ajax({
		url : '/admin/promotion/list.json',
		type : "POST",
		async : false,
		data : {
			promoType : '1'
		},
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


function goDetail(promoId) {
	var url = '';
	url = '/Admin/Promotion/Detail';
	location.href = url + "?promotion_id=" + groupId;	
}

</script>

		
</body>
</html>