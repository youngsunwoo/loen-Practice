<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
   
<html>
<head>
    <title>회원가입 화면</title>
    
   
	<link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
	   
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>	
    <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.id.value){
                $('#inner').append('아이디를 입력하세요.');
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
		function checkDuplicate() {
			alert("버튼1을 누르셨습니다.");
		}
    </script>
    
</head>
<body>


    
    <div id="wrap" class="join">
    
	    <div id="member_header">
			<!-- GNB -->
			<div id="gnb">
				<h1><a href="#" title="Melon 메인" onclick="javascript:MemberEtc.goPage('MAIN');"><img src="https://cdnimg.melon.co.kr/resource/image/web/member/img_logo206x56.png" width="206" height="56" alt="Melon"></a></h1>
			</div>
			<!-- //GNB -->
		</div>
    
    <div id="member_cont_wrap" class="clfix">
		<div id="conts_section">
		      <div class="box_mem_info">
						<h2 class="mem_info_title">회원가입</h2>
						<form name="join_form" id = "join_form" method="post">
							
							<input type="hidden" id="memberGender" name="memberGender" >	
		
							<div class="mem_info_cont type_border mt25">
								<div class="tb_list03 pt10">
									<table border="1" style="width:100%">
										<colgroup>
											<col style="width:94px">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><div class="wrap">아이디</div></th>
												<td>
													<div class="wrap">
														<div id="memberId_tr" class="wrap_input_info05 d_input_write" style="width:331px;">
															<div class="wrap_input">
																<input type="text" id="user_id" name=""user_id"" title="아이디 입력 편집창" placeholder="25자 이하로 입력" class="text53" style="width:276px;">
															</div>
															<div class="wrap_input_check">
																<input type="button" id="duplicateCheck" name="duplicateCheck" class="btn btn-default" value = "중복체크" onclick="checkDuplicate()">
															</div>
														</div>
														<p id="UserId_msg" class="txt_error03" style="display:none;"></p>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><div class="wrap">이름</div></th>
												<td>
													<div class="wrap">
														<div id="memberId_tr" class="wrap_input_info05 d_input_write" style="width:331px;">
															<div class="wrap_input">
																<input type="text" id="user_name" name="user_name" title="이름 입력 편집창" placeholder="" class="text53" style="width:276px;">
															</div>
														</div>
														<p id="memberId_msg" class="txt_error03" style="display:none;"></p>
													</div>
												</td>
											</tr>
											
											<tr>
												<th scope="row"><div class="wrap">비밀번호</div></th>
												<td>
													<div class="wrap">
														<div id="memberPwd1_tr" class="wrap_input_info04 wrap_input_pw d_input_write" style="width:331px;">
															<div class="wrap_input">
																<input type="password" id="UserPwd1" name="UserPwd1" title="비밀번호 입력 편집창" placeholder="비밀번호 입력" class="text53 d_input_key" style="width:212px;">
																<label for="memberPwd1" class="pw_label">비밀번호 입력</label>
															</div>
															<div class="wrap_input" style="display:none;">
																<input type="text" id="memberPwd12" title="비밀번호 입력 편집창" placeholder="비밀번호 입력" class="text53 d_input_key" style="width:212px;">
															</div>
														</div>
														<p id="signKey_msg" class="txt_error02" style="display:none" title="오류메세지">.</p>
														<p id="memberPwd1_msg" class="txt_error03" style="display:none;"></p>
														<div id="memberPwd2_tr" class="wrap_input_info04 wrap_input_pw d_input_write mt12" style="width:331px;">
															<div class="wrap_input" style="display: block;">
																<input type="password" id="UserPwd2" name="UserPwd2" title="비밀번호 확인 편집창" placeholder="비밀번호 확인" class="text53 d_input_key" style="width:212px;">
																<label for="memberPwd2" class="pw_label">비밀번호 확인</label>
															</div>
															<div class="wrap_input" style="display: none;">
																<input type="text" id="memberPwd22" title="비밀번호 입력 편집창" placeholder="비밀번호 확인" class="text53 d_input_key" style="width:212px;">
															</div>
														</div>
														<p id="memberPwd2_msg" class="txt_error03" style="display:none;"></p>
													</div>
												</td>
											</tr>
											
											<tr class="tr_type01">
												<th scope="row"><div class="wrap">성별</div></th>
												<td>
													<div class="wrap">
														<div class="box_select_gender">
															<ul class="wrap_list_radio">
																<li class="d_input_check" id="genderCheckM">
																	<div class="box_check_radio">
													                    <input type="radio" name="gender" id="genderM" class="input_check">
													                    <label for="genderM" class="label_check"><span class="icon"></span>남자</label>
													                </div>
																</li>
																<li class="d_input_check"  id="genderCheckW">
																	<div class="box_check_radio">
													                    <input type="radio" name="gender" id="genderW" class="input_check">
													                    <label for="genderW" class="label_check"><span class="icon"></span>여자</label>
													                </div>
																</li>
															</ul>
														</div
														<p id="memberGender_msg" class="txt_error03" style="display:none;"></p>
													</div>
												</td>
											</tr>
											<tr>
												<th scope="row"><div class="wrap">생년월일</div></th>
												<td>
													<div class="wrap">
														<div class="box_birth_input">
															<div id="birthYear_tr" class="wrap_input_info05 d_input_write" style="width:129px;">
																<div class="wrap_input">
																	<input type="text" id="birthYear" name="birthYear" title="생년월일 년 입력 편집창" placeholder="" class="text53" style="width:80px;" maxlength="4"><span class="txt">년</span>
																</div>
															</div>
		
															<div id="birthMonth_tr" class="wrap_input_info05 d_input_write" style="width:81px;">
																<div class="wrap_input">
																	<input type="text" id="birthMonth" name="birthMonth" title="생년월일 월 입력 편집창" placeholder="" class="text53" style="width:35px;" maxlength="2"><span class="txt">월</span>
																</div>
															</div>
		
															<div id="birthDay_tr" class="wrap_input_info05 d_input_write mr0" style="width:81px;">
																<div class="wrap_input">
																	<input type="text" id="birthDay" name="birthDay" title="생년월일 일 입력 편집창" placeholder="" class="text53" style="width:35px;" maxlength="2"><span class="txt">일</span>
																</div>
															</div>
														</div>
														<p id="parentAgree_msg" class="txt_input_info02" style="display:none;">만 14세 미만인 경우 보호자(법정대리인)동의가 필요합니다.</p>
														<p id="birth_msg" class="txt_error03" style="display:none;"></p>
													</div>
												</td>
											</tr>
											
										</tbody>
									</table>
								</div>
							</div>
		
							<div class="wrap_btn_c mt34">
								<a href="#" id="join_step" class="btn btn_square_green66" onclick="javascript:joinStep();">가입 완료</a>
							</div>
						</form>
					</div>
					
				</div>
			</div>
       				   
    </div>
    
    
    <script type="text/javascript">
    
	$(document).ready(function(){
	    $('input:radio[name=gender]').click(function() {
			var i = $('input:radio[name=gender]').index(this);
			alert('test : '+i)
			if(i==0){	//성별 남
				$("#memberGender").val("1");
				$("#genderCheckM").addClass("on");
				$("#genderCheckW").removeClass("on");
			}else{		//성별 여
				$("#memberGender").val("2");
				$("#genderCheckM").removeClass("on");
				$("#genderCheckW").addClass("on");
			}
		});
	    
	    
	    var formData = $("#join_form").serialize();
	    
	    $('join_step').click(function() {
	    		
	    	
			 var formData = $("#Promo_info").serialize();
				
	 		 $.ajax({
	 			url : '/joinProcess',
                type: "POST",	
	 			data : formData,
                dataType : "json",
                success: function(data) {
                    if(data == null){
                    	
                    }else{
                    	 alert("프로모션 생성 완료!");
                    	 openShareWindow(data);
                    }
                },
	 		 	   error:function(xhr, textStatus, error){
				 		alret( "오류가 발생했습니다. 관리자에게 문의해주세요.")
				 	 }
	 		 });
	 		 
	    	
	    	
	    }
	    
	    
	});
	    
	 </script>
</body>
</html>
