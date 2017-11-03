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

<title>Insert title here</title>
</head>
<body>


<div id="wrap" style =" padding: 10px; ">

<form name="form0" id="form0" method="post">

	<div align="center" style="font-size: 15px; line-height: 1.0em; font-family: 돋움체; padding: 5px; margin: 5px;">
			<!-- 검색 -->
			<table> 
			<tr>	
				<td>
		
					<table class="tblDefault">
						<tbody class="al">
						<tr>
							<th style="padding: 5px;">
					   			 <label   style=" margin: 5px; font-weight: bold;" >프로모션 Filter</label>
							</th>
							<td>
								<table>
									<tbody>
										<tr>
											<td style="text-align: left;">&nbsp;
												프로모션ID : <input type="text" id="promoId" name="promoId" value="" size="10" title="">&nbsp;&nbsp;
												
												기간 : <input type="text" name="createDate" id="createDate" value="" size="10" readonly="" class="hasDatepicker">
													   &nbsp;~&nbsp;
													  <input type="text" name="dueDate" id="dueDate" value="" size="10" readonly="" class="hasDatepicker">&nbsp;&nbsp;
						
												유형 : <select id="promoType" name="promoType" >
														<option value="">전체</option>
															<option value="1">다함께받기</option>
															<option value="2">나혼자받기</option>
													  </select>&nbsp;&nbsp;
						
												혜택 : <select id="benefitCode" name="benefitCode">
														<option value="">전체</option>								
															<option value="01">할인쿠폰</option>								
															<option value="02">포인트적립</option>								
															<option value="03">캐시백</option>								
													  </select>&nbsp;&nbsp;
											    상태 : <select id="state" name="state">
														<option value="">전체</option>								
															<option value="1">진행중</option>								
															<option value="1">종료</option>
													  </select>&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr >
							<th style="padding: 5px;">
								 <label   style=" margin: 5px; font-weight: bold;" >생성 User Filter</label>
							</th>
							<td>
								<table >
									<tbody>
										<tr>
											<td style="text-align: left;">&nbsp;
												사용자 ID : <input type="text" id="userId" name="userId" value="" size="10" title="">&nbsp;&nbsp;
												
												이름 : <input type="text" id="userName" name="userName" value="" size="10" title="">&nbsp;&nbsp;
												
												성별 : <select id="gender" name="gender" >
														<option value="">전체</option>
															<option value="1">남</option>
															<option value="2">여</option>
													  </select>&nbsp;&nbsp;
						
												나이 : <input type="text" name="ageFrom" id="ageFrom" value="" size="2" readonly="" class="hasDatepicker">
													   &nbsp;~&nbsp;
													  <input type="text" name="ageTo" id="ageTo" value="" size="2" readonly="" class="hasDatepicker">&nbsp;&nbsp;
						
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<th style="padding: 5px;">
								 <label   style=" margin: 5px; font-weight: bold;"  >상품 Filter</label>
							</th>
							<td>
								<table>
									<tbody>
										<tr>
											<td style="text-align: left;">&nbsp;
												상품코드 : <input type="text" id="productCode" name="productCode" value="" size="10" title="">&nbsp;&nbsp;
												
												상품이름 : <input type="text" id="productName" name="productName" value="" size="10" title="">&nbsp;&nbsp;
												
												상품가격 : <input type="text" name="priceFrom" id="priceFrom" value="" size="10" readonly="" class="hasDatepicker">
													     &nbsp;~&nbsp;
													    <input type="text" name="priceTo" id="priceTo" value="" size="10" readonly="" class="hasDatepicker">&nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					 </tbody>
					</table>
					
			</td>
				<td>
					<button type="button" id="searchBtn" data-loading-text="조회 중" class="btn btn-primary" autocomplete="off" style="margin-right: 20px;">
						<span class="glyphicon glyphicon-search"></span>조회
					</button>
				</td>
			</tr>
			</table>		
	</div>

</form>
		
	<div id="Container">
		<h4>프로모션 리스트</h4>
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
	    	field: "joinCnt",
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
		
		var formdata = $("#form0").serialize();
		
		
	    $.ajax({
			url : '/admin/promotion/list.json',
			type : "POST",
			async : false,
			data : formdata,
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



<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="position: absolute; top: 229px; left: 41.6562px; z-index: 1; display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="이전달"><span class="ui-icon ui-icon-circle-triangle-w">이전달</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="다음달"><span class="ui-icon ui-icon-circle-triangle-e">다음달</span></a><div class="ui-datepicker-title"><span class="ui-datepicker-year">2017</span>&nbsp;<span class="ui-datepicker-month">년 11월</span></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="Sunday">일</span></th><th><span title="Monday">월</span></th><th><span title="Tuesday">화</span></th><th><span title="Wednesday">수</span></th><th><span title="Thursday">목</span></th><th><span title="Friday">금</span></th><th class="ui-datepicker-week-end"><span title="Saturday">토</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">29</span></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">30</span></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">31</span></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">1</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">2</a></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default ui-state-highlight" href="#">3</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">4</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">5</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">6</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">7</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">8</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">9</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">10</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">11</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">12</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">13</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">14</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">15</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">16</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">17</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">18</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">19</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">20</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">24</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">25</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">26</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">27</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="10" data-year="2017"><a class="ui-state-default" href="#">30</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">1</span></td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">2</span></td></tr></tbody></table></div>
		
</body>
</html>