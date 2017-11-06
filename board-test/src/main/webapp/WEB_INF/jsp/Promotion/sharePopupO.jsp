<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	
<link rel="stylesheet" href="/PaperBootstrap.css" type="text/css">

<html>
<head>
    <title>나의 프로모션 공유하기</title>
    
    <link rel="stylesheet" href="https://cdnimg.melon.co.kr/static/member/resource/style/me1/qy/y/1edydz6hfyj.css" type="text/css">
    	<style type="text/css">
    	
    	.evenvtBt {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 25px;
    margin-left: 20px;
    margin-right: 20px;
}
    
    	
    	
    	</style>
</head>
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
						<div class="login_input_area02 style02" style="width:450px;">
						<div class="wrap_login_input" style="width:450px;">
								
							
							<div class="wrap_insert" style="width:450px;" d>
								
									<input type="text" name="promotionUrl" id="promotionUrl" value="http://localhost:8080/Promotion/Detail?promotion_id=${promotionId}" title="URL창" class="text51" style="width:450px; width:450px;text-align: center;"">
								
								
							</div>	
						</div>
							
								<br>	
								
					<div class="SNS_Share_Top hidden-xs" style="margin:width:450px; text-align: center;">																			
								<!-- Share on Twitter -->
								<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
								+encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog',
								 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter">
								 <img src="/img/shareIcon/Twitter.png"></a>
								
								<!-- Share on Facebook -->
								<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u='
								+encodeURIComponent(document.URL)+'&amp;t='+encodeURIComponent(document.title), 'facebooksharedialog',
								 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook">
								<img src="/img/shareIcon/facebook.png"></a>
												
								<!-- Share on Google+ -->
								<a href="#" onclick="javascript:window.open('https://plus.google.com/share?url='+encodeURIComponent(document.URL), 'googleplussharedialog','menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=350,width=600');return false;" target="_blank" alt="Share on Google+">
								<img src="/img/shareIcon/Google_Plus.png"></a>
								
								<!-- Share on Kakaostory -->
								<a href="#" onclick="javascript:window.open('https://story.kakao.com/s/share?url='+encodeURIComponent(document.URL), 'kakaostorysharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=400,width=600');return false;" target="_blank" alt="Share on kakaostory">
								<img src="/img/shareIcon/Kakao_Story.png"></a>
								
								<!-- Share on Naver -->
								<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url='
								+encodeURIComponent(document.URL)+'&amp;title='+encodeURIComponent(document.title),
								 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" target="_blank" alt="Share on Naver">
								<img src="/img/shareIcon/Naver.png"></a>
					  </div>		
						
						
						
						</div>
					</div>
				</div>
			</div>
		</div>

</body>
</html>