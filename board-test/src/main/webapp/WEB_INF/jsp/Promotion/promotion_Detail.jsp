<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session="true" %>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css">

<link rel="stylesheet" href="/PaperBootstrap.css" type="text/css">
   
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
	
	
<link rel="stylesheet" href="/css/steps.css" type="text/css">

</head>
<body>

 <div id="wrap" class="join">
	<div id="member_header" 
		style="  background: #2a2c37 url(http://cdnimg.melon.co.kr/resource/image/web/event/bg_vip_benefit01.jpg) no-repeat 0 0; width: 1008px;">
	
			<!-- GNB -->
			<div id="gnb" >
				<h2>
				<p style="color: #f9f1d8; font-size: 15px; margin-top: 20px; padding: 30px;">
					[ ${ownUser.user_name} ] 님이 추천하는 상품을 구매하고 특별한 혜택을 함께하세요!
				</p>
				</h2>
				
				<h2 class="mem_info_title"> ${ownUser.user_name} 님의 Promotion</h2>
			</div>
			<!-- //GNB -->
	
    
    <div id="member_cont_wrap" class="clfix">
    
					<h2>추천상품</h2>
		<div class="box_mem_info" style=" background: rgba(0, 0, 0, 0);">
					
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
     	 </div>
      </div>

	</div>
	
	
	
	<div id="member_header" 
		style="  background: #f3f3f2; width: 1008px;">
		
		<div id="gnb">
				<h2>
				<!-- 모일수록 커지는 혜택 img -->
				<img src="/img/promo_1.png" width="250" height="85" style="position: relative;margin: auto;">

				</h2>
				
				<h2 class="mem_info_title"> SUNNY 님의 Promotion</h2>
			</div>
			
			
			<!-- 혜택 출력하기 위해서 추가한 내역 -->
			
				<div class="container">
				<div class="row">
					<section>
			        <div class="wizard">
			            <h1>Test</h1>
			            ${promotion.join_cnt}
			            
			            <div class="wizard-inner">
			                <div class="connecting-line"></div>
			                <div class="connecting-line" style="background: #5BC0D8; width: 32%; margin-left: 10%;"></div>
			                <ul class="nav nav-tabs" role="tablist" id="stepContent">
			                
			 
			
			                   
			                </ul>
			            </div>
			
			            <form role="form">
			                <div class="tab-content" id = "tab-content">
			                    <div class="tab-pane active" role="tabpanel" id="step1">
			                        <h3>Step one</h3>
			                        <p>first step</p>
			                        <ul class="list-inline pull-right">
			                            <li><button type="button" class="btn btn-primary next-step">next</button></li>
			                        </ul>
			                    </div>
			                    <div class="tab-pane" role="tabpanel" id="step2">
			                        <h3>Step two</h3>
			                        <p>Second step</p>
			                        <ul class="list-inline pull-right">
			                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
			                            <li><button type="button" class="btn btn-primary next-step">next</button></li>
			                        </ul>
			                    </div>
			                    <div class="tab-pane" role="tabpanel" id="step3">
			                        <h3>Step three</h3>
			                        <p>Third step</p>
			                        <ul class="list-inline pull-right">
			                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
			                            <li><button type="button" class="btn btn-default next-step">next</button></li>
			                        </ul>
			                    </div>
			                    <div class="tab-pane" role="tabpanel" id="complete">
			                        <h3>Complete steps</h3>
			                        <p>You have successfully completed every steps.</p>
			                        <ul class="list-inline pull-right">
			                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
			                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Submit</button></li>
			                        </ul>
			                    </div>
			                    <div class="clearfix"></div>
			                </div>
			            </form>
			       	    </div>
			   		 </section>
			 	</div>
				</div>
	
	
	
			<!-- 혜택 출력용 끝 -->
			
			
		
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
	 
	 
	 
	 <!--  혜택 출력하는 쪽에 필요한 Script -->
	 
			 
		<script>
			$(document).ready(function () {
				
				//가져오기 
			    var benefits = ${benefits} 
			    var joinCnt =  ${promotion.join_cnt}
			    	    
			    var benefit_list_html  = ''
			    
			    var tab_content_html  = ''
			
			    
			    
			    for (var i = 0; i < benefits.length; i++) {
		    	    		var obj = benefits[i];
		    	    			if (joinCnt > obj.goal_cnt) {
		    	    			 	benefit_list_html += '<li role="presentation" class="active" style="width: 20%;">'
		    	    			}else{
			   	   			benefit_list_html += '<li role="presentation" class="disabled"  style="width: 20%;">'
		    	    			}
					   	benefit_list_html += '<a href="#' +obj.offer +obj.unit+'" data-toggle="tab" aria-controls="step1" role="tab" title="" data-original-title="' +obj.offer +obj.unit+'">'
					   	benefit_list_html += '<span class="round-tab"> '+  obj.goal_cnt   +' </span>    </a>   </li>		'
					   	
			    }
			    $("#stepContent").append(benefit_list_html);
			    	
			    var stepsWidth = 1/benefits.length+1
			    
				
			    //Initialize tooltips
			    $('.nav-tabs > li a[title]').tooltip();
			    
			    
			    //목표 갯수에 따른 width변
			    $('.wizard .nav-tabs > li').css('width', '20%'); 
			    
			    
			    $('#stepContent').append
			   
			    
			    //Wizard
			    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
			
			        var $target = $(e.target);
			    
			        if ($target.parent().hasClass('disabled')) {
			            return false;
			        }
			    });
			
			    $(".next-step").click(function (e) {
			
			        var $active = $('.wizard .nav-tabs li.active');
			        $active.next().removeClass('disabled');
			        nextTab($active);
			
			    });
			    $(".prev-step").click(function (e) {
			
			        var $active = $('.wizard .nav-tabs li.active');
			        prevTab($active);
			
			    });
			    
			});
			
			function nextTab(elem) {
			    $(elem).next().find('a[data-toggle="tab"]').click();
			}
			function prevTab(elem) {
			    $(elem).prev().find('a[data-toggle="tab"]').click();
			}
		
		</script>	
	
	
</body>
</html>