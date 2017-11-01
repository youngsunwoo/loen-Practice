/**
 * 레거시 푸터 대체용
 */

var ERROR = "ERROR";

var FORM = "FORM";
var INSERT = "INSERT";
var UPDATE = "UPDATE";
var DELETE = "DELETE";
var SELECT = "SELECT";

var INSERT_OK = "INSERT_OK";
var UPDATE_OK = "UPDATE_OK";
var DELETE_OK = "DELETE_OK";
var SELECT_OK = "SELECT_OK";
var FORM_OK = "FORM_OK";

$(document).ready(function() {
	$(datePick());

	$('span[id="addButton"]').each(setButten);
	$('a[id="gotoView"]').each(gotoView);
	$('a[id="gotoPopup"]').each(gotoPopup);

	// 달력설정
	autoDate();

	// 페이지 시작시 처리
	PageOnLoad();
});

