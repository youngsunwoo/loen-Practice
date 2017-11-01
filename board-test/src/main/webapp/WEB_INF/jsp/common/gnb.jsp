<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<a href="/main.htm"> <img class="logo" alt="logo" src="/resource/image/common/logo_melon.png">
			</a>
		</div>
		<div class="col-md-10">
			<div id="user-div" class="pull-right">
				<small class="user-gnb"></small>
				<button type="button" class="btn btn-primary btn-sm" id="logoutBtn">LOGOUT</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$("#logoutBtn").on("click", function() {
		location.href = "/auth/logout.htm";
	});

	$("img.logo").on("click", function() {
		common.go("/");
	});

	$(window).load(function() {
		$.ajax({
			type : "POST",
			url : "/common/gnb.json",
			success : function(data) {
				var user = data.adminUser;
				var txt = user.userName +"(" + user.userId+") /" + user.clientIp +" / " +user.loginDate.replace(/(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})(\d{3})/gi,"$1-$2-$3 $4:$5:$6");
				$("#user-div>.user-gnb").text(txt);
			}
		});
	});
</script>