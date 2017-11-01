<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp"%>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="/resource/js/html5shiv.min.js"></script>
  <script src="/resource/js/respond.min.js"></script>
<![endif]-->
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
	<div class="container-fluid">
		<ul class="nav navbar-nav" id="topMenuList"></ul>
	</div>
</nav>
<script type="text/javascript">

	$(window).load(function() {
		var firstUrl = "";
		var firstPath = "";
		$.ajax({
			type : "POST",
			url : "/common/top.json",
			success : function(data) {
				$.each(data.menuList, function(i, obj) {

					var appendStr = "";
					appendStr += "<li class='dropdown'>";
					appendStr += "<a href='#' class='dropdown-toggle top-menu' data-toggle='dropdown'>";
					appendStr += obj.menuName;
					appendStr += "<b class='caret'></b>";
					appendStr += "</a>";
					if(i==0){
						firstPath += "<li>"+obj.menuName+"</li>";
					}

					if(common.isArray(obj.subMenuList)) {
						appendStr += "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu'>";

						$.each(obj.subMenuList, function(j, innerObj) {

							if(common.isArray(innerObj.subMenuList)) {

								appendStr += "<li class='dropdown-submenu'>";
								appendStr += "<a tabindex='-1' href='#'>";
								appendStr += innerObj.menuName;
								appendStr += "</a>";
								appendStr += "<ul class='dropdown-menu'>";

								$.each(innerObj.subMenuList, function(k, leafObj){
									appendStr += "<li>";
									appendStr += "<a href=\"#\" onclick=\"javascript:menu.goMenu('" + leafObj.menuUrl + "', this)\" tabindex='" + (k==0 ? -1 : "") +"'>";
									appendStr += leafObj.menuName;
									appendStr += "</a>";
									appendStr += "</li>";
									if(i==0 && j==0 && k == 0){
										firstUrl=leafObj.menuUrl;
										firstPath+= "<li>"+innerObj.menuName+"</li><li class=\"active\">"+leafObj.menuName+"</li>";
									}
								});

								appendStr += "</ul>";
								appendStr += "</li>";
							} else {

								appendStr += "<li>";
								appendStr += "<a href=\"#\" onclick=\"javascript:menu.goMenu('"+innerObj.menuUrl+"', this)\">";
								appendStr += innerObj.menuName;
								appendStr += "</a>";
								appendStr += "</li>";
								if(i==0 && j==0){
									firstUrl = innerObj.menuUrl;
									firstPath += "<li class=\"active\">"+innerObj.menuName+"</li>";
								}
							}
						});
						appendStr += "</ul>";
					}

					appendStr += "</li>";
					$("#topMenuList").append(appendStr);
				});
			},
			complete : function(){

				$(".dropdown-submenu>a").mouseenter(function(){
					$(".dropdown-submenu>.dropdown-menu").hide();
					$(this).next().show();
				});

				var _curActiveMenu = $("nav li a[onclick*='"+window.location.pathname+"']");
				menu.printNavBar(_curActiveMenu);

				if(window.location.pathname.indexOf("main.htm") > -1 && firstUrl.indexOf("main.htm")==-1){
					common.go(firstUrl);
					$("header #nav #navigationPath").html(firstPath).show();
				}
			}
		});
	});

	var menu = {
			goMenu : function(url, _this) {
				menu.printNavBar(_this);
				common.go(url);
				$(".dropdown-submenu>.dropdown-menu").hide();
			},
			printNavBar : function(_this){
				var pathStr = "";
				var textArray = $(_this).parent("li").parents("li");
				for(var i = textArray.length; i>=0;i--) {
					var txt = $(textArray[i]).children("a").first().text();
					if(txt != "") {
						pathStr += "<li>" + txt + "</li>";
					}
				}
				pathStr += "<li class=\"active\">" + $(_this).text() + "</li>";

				$("header #nav #navigationPath").html(pathStr).show();
			}
		};
</script>
