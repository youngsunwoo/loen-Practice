/**
 *
 */
var Pagination = function(url, targetId, navId, pageSize){
	var self = this;
	this.url = url;		// 페이징 처리 URL
	this.targetId = targetId;	// 페이징 처리후 목록이 출력될 div ID
	this.navId = navId;			// 페이지네비게이션이 출력될 div ID
	this.params = [];			// 동적 파라미터
	this.pageSize = pageSize;	// 한페이지에 표시될 게시물 수

	// 파라미터 추가
	this.addParam = function(id, value) {
		this.params[id] = value;

	};

	// 첫째 페이지로 이동(onchange 이벤트에서 사용)
	this.sendFirstPage = function() {
		this.sendPage(1);
	};

	// 페이지 이동
	this.sendPage = function(startIdx) {
		var param = {startIndex: startIdx, pageSize: this.pageSize};
		for (key in this.params) {
			param[key] = this.params[key];
		}
		$.get(this.url, param, function(data) {
			var expr = new RegExp('td>[ \t\r\n\v\f]*</td', 'g');
			$("#"+self.targetId).html(data.replace(expr, 'td></td')  );
			self.show();
		});
	};

	this.show = function() {
	};
};