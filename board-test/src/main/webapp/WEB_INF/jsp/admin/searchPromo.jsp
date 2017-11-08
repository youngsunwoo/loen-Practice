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
<script type="text/javascript" src="/js/sugar.js"></script>

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

<div id="wrap" style =" padding: 20px; ">

	<form name="form0" id="form0" method="post">
	
		<div align="center" style="font-size: 12px; line-height: 1.0em; font-family: 돋움체; padding: 5px; margin: 5px;">
				<!-- 검색 -->
				<table > 
				<tr>	
					<td><table class="table">
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
													프로모션ID : <input type="text" id="promoId" name="promoId" value="" size="12" title="">&nbsp;&nbsp;
													
													기간 : <input type="text" name="createDate" id="testDatepicker" value="" size="10" readonly="" class="hasDatepick">
														   &nbsp;~&nbsp;
														  <input type="text" name="dueDate" id="dueDate" value="" size="10" readonly="" class="hasDatepick">&nbsp;&nbsp;
							
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
													사용자 ID : <input type="text" id="userId" name="userId" value="" size="15" title="">&nbsp;&nbsp;
													
													이름 : <input type="text" id="userName" name="userName" value="" size="15" title="">&nbsp;&nbsp;
													
													성별 : <select id="gender" name="gender" >
															<option value="">전체</option>
																<option value="1">남</option>
																<option value="2">여</option>
														  </select>&nbsp;&nbsp;
							
													나이 : <input type="text" name="ageFrom" id="ageFrom" value="" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'>
														   &nbsp;~&nbsp;
														  <input type="text" name="ageTo" id="ageTo" value="" size="3" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' >&nbsp;&nbsp;
							
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
						<button type="button" id="searchBtn" data-loading-text="조회 중" class="btn btn-primary" autocomplete="off" style="margin-left: 20px;">
							<span class="glyphicon glyphicon-search"></span>조회
						</button>
					</td>
				</tr>
				</table>		
		</div>
	
	</form>
			
	<br>
		<h4>프로모션 리스트</h4>
		<div style="margin-top:5px;">
			<div id="table1">
				<table id="dataTable"></table>
			</div>
		</div>
	
</div>


<script type="text/javascript">

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};


</script>

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
	        		return "<a href='/Admin/Promotion/Detail?promId="+value+"'>"+value+"</a>";	
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
	        title: "시작일자",
	        align: 'center',
	        sortable:true,
	        formatter : function(value) {
	        			var date = new Date(value)
	        			var year = date.getFullYear();
	        			var month = date.getMonth()+1;
	        			var day = date.getDay();
	        			var hour = date.getHours();
	        			var min = date.getMinutes();
	        			var sec = date.getSeconds();

					return date.format("yyyy-MM-dd HH:mm:ss")
					//return year+'-'+month+'-'+day+' '+hour+':'+min+':'+sec
	        			}
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
		$(function() {
		    
		    $( ".hasDatepick" ).datepicker({   dateFormat: "yy-mm-dd"  });

		
		  });

	
	$(function() {
	    $( "#testDatepicker" ).datepicker({
	    });
	});
		
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
	
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}

</script>

	
</body>
</html>