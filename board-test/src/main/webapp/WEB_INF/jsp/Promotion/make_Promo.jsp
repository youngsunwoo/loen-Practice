<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
   
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script src="ex04.js">
</script>

<!DOCTYPE html>
<html>
<head>
    <title>MAKE PROMOTION</title>
    <style>
        .setDiv {
            padding-top: 100px;
            text-align: center;
        }
        .mask {
            position:absolute;
            left:0;
            top:0;
            z-index:9999;
            background-color:#000;
            display:none;
        }
        .window {
            display: none;
            background-color: #ffffff;
            height: 200px;
            z-index:99999;
        }
    </style>
</head>

<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">프로모션 만들기</font></b>
        <br>
       
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 /getBenefit.jsp -->
        <form method="post" action="/Promotion/insertPromotion" name="Promo_info" onsubmit="return checkValue()">
            <table>
                 <tr>
                    <td id="title">보상형태</td>
                    <td>
                        <input type="radio" name="promo_type" value="1" checked>나혼자
                        <input type="radio" name="promo_type" value="2">다함께
                    </td>
                </tr>
                
                <tr>
                    <td id="title">보상종류</td>
                    <td>
                         <select id="benefit_code" name="benefit_code" onchange="select_benefit()">
                            <option value="00">혜택선택</option>
                            <option value="01">할인쿠폰</option>
                            <option value="02">Point적립</option>
                            <option value="03">가격할인</option>
                        </select>
                    </td>
                </tr>
                
                  <tr> <td> <br> <div id="benefit_div"></div> </td> </tr>  
              
                <tr> 
                   <td>
		            		<div>
			    				<input type="button" href="#" class="showMask" value="상품선택"> 
						    <div class="mask">
						       <div class="window"> 
						       		<input type="button" href="#" class="close" value="(닫기)" style="float = right" />
						    			<div id="Product_list_div">  </div>
						       </div>
						    </div>
						</div>
					</td>
	            </tr>
	            
	            <tr> <td> <br> <div id="Product_div"> </div> </td> </tr>  
	            
	          
            </table>
            <br>
            <input type="submit" value="제출하기 ">  
           </form>
    </div>
    
    <br>
</body>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
	
	<script type="text/javascript">
	
	   //데이터 넘기기전 필수 입력정보 혜택 / 상품코드가 제대로 선택되었는지 확인 
		    function checkValue()
		    {
		       var selected_benefit = $("#benefit_code option:checked").val()
		       if( selected_benefit == '00'){
		            alert("혜택종류를 선택하세요." );
		            return false;
		        }
		    }
	
	
		/////////////////////////////////////////////////////////
		//                  상품관련된 JavaScript                 //
		/////////////////////////////////////////////////////////
	
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
		        $('.showMask').click(function(e){
		        	
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
		 
		        // 닫기(close)를 눌렀을 때 선택한 상품정보 메인 페이지에 뿌려주기 
		        $('.window .close').click(function (e) {

		            e.preventDefault();
		            $('.mask, .window').hide();
		            
		         	$.ajax({
			                url : '/getProductInfo',
			                type: "get",	
				              data : {  "product_code" :   $("input[name=product_code]:checked").val() },	
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
			        	  product_list_html  += '<input type="radio" name="product_code" value="' + obj[i].product_code + '" > </tr>' ;
			          }
		        	  product_list_html += '</table>'
		        	  
		          $("#Product_list_div").append(product_list_html);
		      }
		    

		      //제품 정보 뿌려주기 
		      function showProductInfo(obj) {
		          $("#ProductInfo").remove();
		          console.log(obj);
		          var product_info_html  = '<table id="ProductInfo">'
		        	  product_info_html += '<tr><th>선택상품</th><th>금 액</th><'
		        	  product_info_html += '<tr><td>' + obj.product_name + '</td><td>' + obj.price + '</td></tr>' ;
		        	  product_info_html += '</table>'
		        	  product_info_html += '<input type="hidden" name = "product_code" vlaue=' + obj.price + '>';
		          $("#Product_div").append(product_info_html);
		      }
		    
	   
		/////////////////////////////////////////////////////////
		//                Benefit 관련된 JavaScript              //
		/////////////////////////////////////////////////////////
		    
	    		//selectbox 선택시 동적으로 받을 혜택 출력해주기 
	    		function select_benefit(){
				 var selected_benefit = $("#benefit_code option:checked").val() //현재 선택한 혜택종류 받아오기 
	          	 if( selected_benefit != '00'){ //미선택이 아니면 화면에 혜택 출력
	          		get_Benefit();
	          	 }
	          	if( selected_benefit == '00'){ //미선택시 출력되어 있던 혜택 출력 내역 삭제  
	                $("#BenefitInfo").remove();
	          	  }
	    		}
	              
	      //동적으로 혜택 가져오기 (Ajax)
	      function get_Benefit(){
	    	 	$.ajax({
	              url : '/getBenefitList',
	              type: "get",
	              data : {  "promo_type" :  $("input[name=promo_type]:checked").val(),
	              			"benefit_code" :  $("#benefit_code option:checked").val() },	
	              dataType : 'json',
	  	   		  	success:  function(obj) {
	  	   		  		showBenefitInfo(obj);
	  	            },
					error:function(){ alert("Error"); }
	          });
	      }
	      
	      //혜택 뿌려주기  
	      function showBenefitInfo(obj) {
	          $("#BenefitInfo").remove();
	          console.log(obj);
	          var benefit_list_html = '<table id="BenefitInfo">'
	        	  benefit_list_html  += '<tr><th>목표인원</th><th>제공내역</th><th>단위</th></tr>'
	          for (var i = 0; i < obj.length; i++) {
	        	  	benefit_list_html += '<tr><td>' + obj[i].goal_cnt + '</td><td>' + obj[i].offer
	                      + '</td><td> ' + obj[i].unit + '</td></tr>';
	          }
	        	  benefit_list_html += '</table>';
	          $("#benefit_div").append(benefit_list_html);
	      }
      
    
    </script>
</html>