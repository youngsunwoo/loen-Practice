<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<html>
<head>
    <title>로그인 화면</title>
    
    <link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
     <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
        
	    	//중복체크 
		function check_exist() {
			alert("버튼1을 누르셨습니다.");
		}
    </script>
    
</head>
<body>
    <body>
<div id="wrap" class="login ">
	<!-- header -->	
	<div id="member_header">
		<!-- GNB -->
		<div id="gnb"><h1><a href="javascript:" class="logo_original" title="Melon 메인" onclick="MemberEtc.goPage('MAIN');return false;"><img src="https://cdnimg.melon.co.kr/resource/image/web/member/img_logo206x56.png" width="206" height="56" alt="Melon"></a></h1></div>
		<!-- //GNB -->
	</div>

	<div id="member_cont_wrap" class="clfix">
		<div id="conts_section">
			<div class="wrap_login_cont">
			<form id="login_form" name="login_form" action="" method="post">
				<input type="hidden" id="saveId" name="saveId" value="N">
				<input type="hidden" id="returnPage" name="returnPage" value="http://www.melon.com/commerce/pamphlet/web/sale_listPromo1View.htm">
				<input type="hidden" id="reqProtocol" name="reqProtocol" value="">
				<input type="hidden" id="reqType" name="reqType" value="">
				<input type="hidden" id="memberId" name="memberId" value="">
				<input type="hidden" id="memberPwd" name="memberPwd" value="">
				<input type="hidden" id="publicKey" name="publicKey" value="">
				<input type="hidden" id="reToken" name="reToken" value="">
			</form>
				<div class="login_input_area02 style02">
				<div class="wrap_login_input">
						
						<div class="wrap_insert">
						<form name="LoginForm" method="post" action="loginProcess" onsubmit="return checkValue()">
       
							<input type="text" name="id" id="id" value="" placeholder="아이디" title="아이디 입력 편집창" class="text51" style="width:390px;">
							<input type="password" name="pw" id="pw" placeholder="비밀번호" title="비밀번호 입력 편집창" class="text51 text_password01" style="width:390px;">
					
							<div class="wrap_save">
								<div class="box_check02">
				                    <input type="checkbox" id="inpSaveId" class="input_check">
				                    <label for="inpSaveId" class="label_check"><span class="icon"></span>아이디 저장</label>
				                </div>
								<div class="wrap_login_info">
									<a href="javascript:" onclick="MemberEtc.goPage('IDSEARCH');return false;" title="아이디 찾기" class="first_child">아이디 찾기</a>
									<span class="bar">|</span>
									<a href="javascript:" onclick="MemberEtc.goPage('PWDSEARCH');return false;" title="비밀번호 찾기">비밀번호 찾기</a>
									<span class="bar">|</span>
									<a href="javascript:" onclick="MemberEtc.goPage('MEMJOIN');return false;" title="회원가입">회원가입</a>
								</div>
							</div>
						</div>
					</div>
										
					<div class="wrap_btn">
						<button type="button" id="btnLogin" title="로그인 " class="btn_login03"  onclick="btnLogin_click();" style="width:390px;"><span>로그인</span></button>
					</div>
					</form>
					
				
                </c:if>
				</div>
			</div>
		</div>
	</div>
	



	<!-- footer -->
	<div id="member_footer" class="">
		<ul class="footer_policy clfix">
			
			<li class="first_child"><a href="http://info.melon.com/terms/web/terms1_1.html" title="이용약관" target="_blank">이용약관</a></li>
			<li><a href="http://info.melon.com/terms/web/terms3.html" title="개인정보처리방침" target="_blank"><strong>개인정보처리방침</strong></a></li>
			<li><a href="http://info.melon.com/terms/web/terms5_1.html" title="청소년보호정책" target="_blank">청소년보호정책</a></li>
			<li><a href="http://faqs2.melon.com/customer/index.htm" title="고객센터" target="_blank">고객센터</a></li>
			
			
		</ul>
		<ul class="footer_menu">			
				<li class="menu01 first"><a href="http://ticket.melon.com" title="Melon 티켓" target="_blank"><span>Melon 티켓</span></a></li>
				<li class="menu04"><a href="http://aztweb.melon.com/aztalk/guide/web/main.htm" title="Melon Aztalk" target="_blank"><span>Melon Aztalk</span></a></li>
				<li class="txt"><span>문의(평일 9시~18시) : 1566-7727(유료)</span></li>
		</ul>
		<p>© LOEN Entertainment, Inc. All rights reserved.</p>
	</div>
	
	<!-- //footer -->





</div>

		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		
			//ID저장 check Box
			$('#inpSaveId').click(function() {
			    if($("#saveId").val()=="N"){
			        $("#saveId").val("Y");
			    }else{
			        $("#saveId").val("N");
			    }
			});
			
		
		  //데이터 넘기기전 필수 확인 
		    function checkValue()
		    {
		   	 	if(!document.LoginForm.id.value){
	                alert("아이디를 입력하세요.");
	                return false;
	            }
	            
	            if(!document.LoginForm.pw.value){
	                alert("비밀번호를 입력하세요.");
	                return false;
	            }
	            
	            return true;
		    }
	  </script>



<script type="text/javascript">

	function btnLogin_click(){
		if(checkValue()){
			 alert("hihihihihi "+$("#id").val()+'   '+$("#pw").val());

		
			//POST방식으로 바꿀것
			$.ajax({
				url:"loginProcess",
				type:'GET',
				dataType:'json',
	              data : {  "id" :  $("#id").val(),
            					"pw" :  $("#pw").val() },	
				contentType: 'text/html;charset=UTF-8',
				mimeType: 'application/json',
				success:function(data) {
					if(data.flagdata) {
						alert(" 세션!!저장되었다!1");
						history.back();
						//이전페이지 주소 알아서 redirect해줄것
					} else {
						alert("아이디,패스워드를 확인해주세요 ");
					}
				},
				error:function(data,status,er) {
					alert("error: "+data+" status: "+status+" er:"+er);
				}
			})
		}
	}
	

</script>




</html>
