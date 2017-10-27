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
<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
<link rel="stylesheet" href="/css/steps.css" type="text/css">



<style type="text/css">

/*Form Wizard*/
.bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
.bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
.bs-wizard > .bs-wizard-step + .bs-wizard-step {}
.bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
.bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
.bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background: #fbe8aa; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 50%;} 
.bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: #fbbd19; border-radius: 50px; position: absolute; top: 8px; left: 8px; } 
.bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
.bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background: #fbe8aa;}
.bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
.bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
.bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
.bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
.bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
.bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
.bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
.bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
/*END Form Wizard*/


        .setDiv {  padding-top: 100px; text-align: center; }
        .mask {  position:absolute; left:0; top:0; z-index:9999; background-color:#000; display:none;  }
        .window {  display: none;  background-color: #ffffff;  height: 200px;  z-index:99999; }

</style>

 <style>


/* Youngsun Custom */ 
.evenvtBt { background-color: #4CAF50;  border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; border-radius: 25px;}
.benefit_goal { border: 1px solid #c59975; margin: 10px; border-radius: 12px; height: 30px; width: 150px; ext-align: center;}
.benefit_info { height: fit-content; margin: auto; width: 300px;  ext-align: center;}
 
    
</style>

</head>
<body>

 <div id="wrap" class="join">
 
	<div class="mask">
		<div class="window"> 
			<input type="button" href="#" class="close" value="(닫기)" style="float = right" />
			<div id="Product_list_div">  </div>
		</div>
	</div>
					
	<form method="post" name="Promo_info" id="Promo_info">
     	<input type="hidden" id="promo_type" name="promo_type" >	
     	<input type="hidden" id="product_code" name = "product_code" >
     	<input type="hidden" id="benefit_code" name = "benefit_code" value ="02" >
     	
	</form>
	
	
	<div id="member_header" 
		style="  background: url(http://cdnimg.melon.co.kr/svc/images/promotion/web/201709/28590/928172752_detail_5.png) no-repeat 0 0; width: 1008px;">
	
		
		<div id="gnb" style="height : 350px;">
				<h2> 보상형태 선택하기 </h2>
		</div>
			
			
			<div class="box_select_gender">
			
			
	                <div class="wrap" style="    margin: auto;    width: fit-content;">
					<img style="width: 200px;margin-left: 50px;margin-right: 50px;" id ="together_img" src="/img/promotion/together.png">
		                 
					<img style="width: 200px;margin-left: 50px;margin-right: 50px;" id ="alone_img"  src="/img/promotion/alone.png">
					</div>
		
			<!--  혜택 선택용 div -->
			
				<div id="benefitSelectDiv" style=" display: none;  border: 1px;margin-top: 30px;margin-bottom: 30px;width: 1008px;padding: 10px;text-align: center;">
 							<ul class="wrap_list_radio">
 								<li class="d_input_check" id="benefit01" style="    margin-right: 75px;    margin-left: 75px;">
 									<div class="box_check_radio">
 									     <input type="radio" name="gender" id="genderM" class="input_check">
 										 <label for="genderM" class="label_check"><span class="icon"></span>할인 쿠폰</label>
 									</div>
 								</li>
 								<li class="d_input_check" id="benefit02"  style="    margin-right: 75px;    margin-left: 75px;">
 									<div class="box_check_radio">
 										<input type="radio" name="gender" id="genderW" class="input_check">
 										 <label for="genderW" class="label_check"><span class="icon"></span>POINT 적립</label>
 									 </div>
 								</li>
 								<li class="d_input_check" id="benefit03"  style="    margin-right: 75px;    margin-left: 75px;">
 									<div class="box_check_radio">
 										<input type="radio" name="gender" id="genderW" class="input_check">
 										 <label for="genderW" class="label_check"><span class="icon"></span>캐시백</label>
 									 </div>
 								</li>
 							</ul>
 				 </div>
 			</div>
			
			<!--  혜택 선택용 div  -->
			.
            
			<!-- 혜택 출력하기 위해서 추가한 내역 -->
			 	<button id="button1" onclick="get_Benefit();">혜택가져오기</button>
			
				<div id="benefitDiv" style="border:1px;  display: none; margin-top: 30px;margin-bottom: 20px;width: 1008px;padding: 10px;">
					<div id="benefitContents"  style=" width: fit-content; margin: auto;" style="width: fit-content;   margin: auto;">
					</div>
				</div>
	
	
			<!-- 혜택 출력용 끝 -->
			
			</div>
	</div>
			
		
	
	
	
	
	
	<div id="member_header" 
		style="  background: #f3f3f2; width: 1008px;">
			<!-- GNB -->
			<div id="gnb" >
				<h2>
				<p style="font-size: 15px; margin-top: 20px; padding: 30px;">
					아래 이용권 이미지를 눌러 원하는 상품을 선택해주세요!
				</p>
			</div>
			<!-- //GNB -->
						  
    
    <div id="member_cont_wrap" class="clfix">
    
		<h2>추천상품</h2>
		<div class="box_mem_info" style=" background: rgba(0, 0, 0, 0);">
					
				<div style=" margin:auto; width: fit-content;padding: 20px;">
						<img id="product_img"  src="/img/product/00000.png" width="250" height="120" style="position: relative;margin: auto;">
						
								
					    			
						<div id = "Product_name_div">
							<p id ='product_name' style="color: #00b423; font-size: 23px; margin-top: 20px;">상품을 선택하세요</p>
						</div>
				</div>
					
				<br>	
					
					
				<div>
				프로모션 아이디 : ${promotion.promo_id} <br>
				주최자 아이디 : ${promotion.user_id}  <br>
				주최자 이름 : ${ownUser.user_name}  <br>
				</div>
				    
     	 </div>
     	 
     	 
     	 <div>
			<table>
			  <tr>
				 <td>
					 <img src="/img/caution.png" width="20" height="20" style="position: relative;margin: 8px;">
					    	    
				 </td>
				 <td>
					 <p>다운로드 파일은 MP3 파일을 지원하는 모든 기기에서 재생되며, 기간 연장이 필요 없습니다.</p>
					  <p>음악 외 어학을 무제한으로 들으실 수 있으며, 음악 곡 수만큼 어학을 다운로드 하실 수 있습니다	</p>
				  </td>
		  	 </tr>
			 </table>
		</div>
		
      </div>
      
	</div>
	
	<div style=" margin:20px; ">
	<center ><input type="submit" href="#" class="evenvtBt" onclick="submitPromotion();" value="프로모션 생성하기 "></center>
	</div>
	
</div>
      
      
	 
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>	
	
	<!----------------------------- UI 및 값 선택관련 ------------------------------------>	
	
    <script type="text/javascript">
    
    		
		
		$(document).ready(function(){
	
			$('input:radio[name=gender]').click(function() {
		   	 	alert('tt');
					var i = $('input:radio[name=gender]').index(this);
					if(i==0){	//다함께받기 	
						$("#benefit_code").val("01");
						$("#benefit01").addClass("on");
						$("#benefit02").removeClass("on");
					}else{		//나혼자받기
						$("#benefit_code").val("02");
						$("#benefit01").removeClass("on");
						$("#benefit02").addClass("on");
					}
					$("#benefitDiv").slideDown("slow");
				});
			    
			
		    //프로모션 타입 선택  
		    //다함께받기 
			 $("#together_img").click(function(){

					$("#promo_type").val("1");
				   	$("#together_img").attr("src",'/img/promotion/together_chk.png');
				   	$("#alone_img").attr("src",'/img/promotion/alone.png');
				    $("#benefitSelectDiv").slideDown("slow");
			 });
			 //나혼자받기 
			 $("#alone_img").click(function(){
					$("#promo_type").val("2");
				   	$("#together_img").attr("src",'/img/promotion/together.png');
				   	$("#alone_img").attr("src",'/img/promotion/alone_chk.png');
				    $("#benefitSelectDiv").slideDown("slow");
					 
			 });
			
		});
		
		
	</script>
	
	
	
<script>
	 		function submitPromotion() {
			    			 alert("submitPromotion");
	
			    	 		 var formData = $("#Promo_info").serialize();
	
			    	 		 $.ajax({
			    	 			url : '/Promotion/insertPromotion',
				                type: "POST",	
			    	 			    data : formData,
				                dataType : "json",
				                success: function(data) {
				                    if(data == null){
				                    	
				                    }else{
				                    	 openShareWindow(data);
				                    }
				                },
			    	 		 	   error:function() { alert("Error"); }
			    	 		 });
			   }
	 		
	 		
	 		function openShareWindow(data){
				var popupOption = 'directories=no, toolbar=no, location=no, menubar=no, status=no, scrollbars=no, resizable=no, left=400, top=200, width=600, height=550';
			 	window.open("/Promotion/SharePopup?promotion_id="+data.promo_id, 'test', popupOption);
			 	location.href("Promotion/Detail?promotion_id="+data.promo_id) 	
		   	}
</script>
	


	<!----------------------------- 상품관련 Script ------------------------------------>	
<script type="text/javascript">

		function wrapWindowByMask(){
		    // 현재 화면 높이와 너비를 받아오기 
		    var maskHeight = $(document).height();
		    var maskWidth = $(window).width();
		
		    // 마스크의 적용할 높이,너비 지정 (화면크기과 같도록 지정)
		    $('.mask').css({'width':maskWidth,'height':maskHeight});
		    //fade Animation : 80%의 불투명으로 변경 
		    $('.mask').fadeTo("slow",0.8);
		
		    // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
		    var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
		    var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
		
		    // css 스타일을 변경
		    $('.window').css({'left':left,'top':top, 'position':'absolute'});
		
		    // 레이어 팝업을 보이도록 설정 
		    $('.window').show();
		}
		

   		$(document).ready(function(){
		        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
		        $('#product_img').click(function(e){
		        	
			        	$.ajax({
			                url : '/getAllProductList',
			                type: "get",	
			                dataType : 'json',
			    	   		  	success:  function(obj) {
			    	   		  		showProductList(obj);
			    	            },
			  				error:function(){ alert("Error"); }
			            });
			        		
		            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.	            
		            e.preventDefault();
		            wrapWindowByMask();
		        });
		 
		        // 닫기(close)를 눌렀을 때 선택한 상품정보 가져오기 
		        $('.window .close').click(function (e) {
		            e.preventDefault();
		            $('.mask, .window').hide();
		            
		         	$.ajax({
			                url : '/getProductInfo',
			                type: "get",	
				            data : {  "product_code" :   $("input[name=product_radio]:checked").val() },	
			               dataType : 'json',
			    	   		  	success:  function(obj) {
			    	   		  		showProductInfo(obj);
			    	            },
			  				error:function(){ alert("Error"); }
			            });
		        });
		    });
    

   			//제품 리스트 뿌려주기 
			function showProductList(obj) {
			        $("#ProductInfo").remove();
			        console.log(obj);
			        var product_list_html  = '<table id="ProductInfo">'
			      	  product_list_html += '<tr><th>상 품 명</th><th>금 액</th><th>선 택</th></tr>'
			        for (var i = 0; i < obj.length; i++) {
				        	  product_list_html += '<tr><td>' + obj[i].product_name + '</td><td>' + obj[i].price + '</td><td> ' 
				        	  product_list_html  += '<input type="radio" name="product_radio" value="' + obj[i].product_code + '" > </tr>' ;
				          }
			      	  product_list_html += '</table>'
			      	  
			        $("#Product_list_div").append(product_list_html);
			}
					
		    //제품 정보 뿌려주기 
		    function showProductInfo(obj) {
			    	$("#product_img").attr("src",'/img/product/'+obj.product_code+'.png');
			    	
		        $("#product_name").remove();
		        var product_info_html  = '<p id ="product_name" style="color: #00b423; font-size: 23px; margin-top: 20px;">'
		      	    product_info_html +=  obj.product_name
		      	    product_info_html += '</p>'
		      	  
		        $("#Product_name_div").append(product_info_html);

				$("#product_code").val(obj.product_code);
		        
		    }
				    
   </script>		    



	<!----------------------------- 혜택관련 Script ------------------------------------>	

	<script type="text/javascript">
	
		    //동적으로 혜택 가져오기 (Ajax)
		    function get_Benefit(){
		  	 	$.ajax({
		            url : '/getBenefitList',
		            type: "get",
			        data : {  "promo_type" :  '1',
			         			"benefit_code" :  '02' },	
		           // data : {  "promo_type" :  $("input[name=promo_type]:checked").val(),
		          //  			"benefit_code" :  $("#benefit_code option:checked").val() },	
		            dataType : 'json',
			   		  	success:  function(obj) {
			   		  		showBenefitInfo(obj);
			   		  		$("#benefitDiv").slideDown("slow");
			            },
						error:function(){ alert("Error"); }
		        });
		    }
		    
		    //혜택 뿌려주기  
		    function showBenefitInfo(obj) {
		        $("#BenefitInfo").remove();
		        console.log(obj);
		        var benefit_list_html = '<table id="BenefitInfo">'
		        for (var i = 0; i < obj.length; i++) {
		        	
		      	  	benefit_list_html += '<tr><td> <div class = "benefit_goal"> <span>' + obj[i].goal_cnt + '명 달성 <span></div></td>'
		      		benefit_list_html += '<td><div class = "benefit_info">' +obj[i].offer + obj[i].unit + '</div></td></tr>';
		        }
		      	  benefit_list_html += '</table>';
		        $("#benefitContents").append(benefit_list_html);
		    } 
	</script>
	 
	 
	
	
</body>
</html>