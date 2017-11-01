/**
 * Admin공통 JS
 */
var common = {
	/**
	 * 검사대상 객체가 배열인지 판단(true/false)
	 */
	isArray : function(obj) {
		return Object.prototype.toString.call(obj) == '[object Array]';
	},
	/**
	 * url을 "container"라는 ID를 가진 영역으로 불러들인다. 오류시 container영역에 오류메세지가 나타난다.
	 */
	go : function(url) {
		this.goUrl(url, "container");
	},
	goUrl : function(url, data) {
		this.goUrl(url, "container", data);
	},
	/**
	 * url을 target ID를 가진 영역으로 불러들인다. 오류시 target 영역에 오류메세지가 나타난다.
	 */
	goUrl : function(url, target, data) {
		var _target = $("#" + target);
		$.ajax({
			url : url,
			type : "POST",
			data : data,
			contentType : "application/x-www-form-urlencoded;charset=utf-8",
			beforeSend : function(xhr, settings) {
				try {
					window.history.pushState({path : window.location.href}, "", url);
				} catch (err) {
					// not working
				}
			},
			success : function(data) {
				var containerObj = $(data).find("#" + target);
				_target.html(containerObj.html()).show();
			},
			error : function(xhr, status, e) {
				var resultTxt = xhr.responseText.match(/<h1>(.*)<\/h1>/gm);
				console.log(resultTxt);
				if (resultTxt != null && resultTxt.length > 0) {
					resultTxt = resultTxt[0];
					resultTxt = resultTxt.replace(/(<([^>]+)>)/ig, "");
					resultTxt = "<div class=\"container\">" + "<div class=\"alert alert-danger\">" + resultTxt
							+ "</div></div>";
					_target.html(resultTxt);
				}
			}
		});
	},

	pagination : function(fnName, totalCount, currentPageStartIndex, showRowCount) {

		// 한페이지에 보여줄 레코드 개수
		var rowCount = Number(showRowCount);

		// 페이지 네비케이션에 보여줄 목록 개수
		var pageSize = 10;

		// 현재 페이지 번호
		var nowPage = Math.ceil(currentPageStartIndex / rowCount);
		nowPage = (Number(nowPage) > 0) ? Number(nowPage) : 1;

		// 총 페이지 개수
		var totalPg = parseInt(totalCount / rowCount);
		var totalPage = (totalCount % rowCount) > 0 ? totalPg + 1 : totalPg;
		totalPage = (Number(totalPage) > 0) ? Number(totalPage) : 1;

		// 현재 페이지 그룹 번호
		var nowBlock = parseInt(nowPage / pageSize);
		nowBlock = (nowPage % pageSize) > 0 ? nowBlock + 1 : nowBlock;
		// 마지막 페이지 그룹 번호
		var maxBlock = parseInt(totalPage / pageSize);
		maxBlock = (totalPage % pageSize) > 0 ? maxBlock + 1 : maxBlock;

		// 현재 페이지 그룹의 첫번째 페이지 번호
		var startPage = ((nowBlock - 1) * pageSize) + 1;
		// 현재 페이지 그룹의 마지막 페이지 번호
		var endPage = startPage + pageSize;

		// 현재 페이지 그룹의 첫 레코드 번호
		var firstStartIndex = (nowBlock - 1) * rowCount + 1;

		// 이전 페이지 그룹 번호
		var beforeBlockPage = ((nowBlock - 2) * pageSize) + 1;
		// 다음 페이지 그룹 번호
		var nextBlockPage = ((nowBlock) * pageSize) + 1;

		if (maxBlock == nowBlock) {
			endPage = (totalPage % pageSize) > 0 ? startPage + (totalPage % pageSize) : startPage + pageSize;
		}
		if (totalCount == 0) endPage = 0;

		var ol = $('.pagination');

		var beforeBlockIndex = ((beforeBlockPage - 1) * rowCount) + 1;
		var lastIndex = ((totalPage - 1) * rowCount) + 1;
		var nextBlockIndex = ((nextBlockPage - 1) * rowCount) + 1;

		var firstAtag = $('<a id="1"><<</span></a>');
		var preAtag = $('<a id="' + beforeBlockIndex + '"><</a>');
		var endAtag = $('<a id="' + lastIndex + '">>></a>');
		var nextAtag = $('<a id="' + nextBlockIndex + '">></a>');

		firstAtag.attr('href', 'javascript:' + fnName + '(1)');
		preAtag.attr('href', 'javascript:' + fnName + '(' + beforeBlockIndex + ')');
		endAtag.attr('href', 'javascript:' + fnName + '(' + lastIndex + ')');
		nextAtag.attr('href', 'javascript:' + fnName + '(' + nextBlockIndex + ')');

		if (nowBlock > 1) {
			ol.append($('<li></li>').append(firstAtag));
			ol.append($('<li></li>').append(preAtag));
		}

		for (var i = startPage; i < endPage; i++) {
			var startIdx = ((i - 1) * rowCount) + 1;
			var aTag = $('<a id="' + startIdx + '"></a>');
			var span = $('<span></span>');
			span.text(i);

			if (Number(nowPage) != i) {
				aTag.attr('href', 'javascript:' + fnName + '(' + startIdx + ')');
			}
			aTag.html(span);

			var li = $('<li></li>');
			if (i == nowPage) {
				li.attr('class', 'active');
			}
			ol.append(li.append(aTag));
		}

		if (nowBlock < maxBlock) {
			ol.append($('<li></li>').append(nextAtag));
			ol.append($('<li></li>').append(endAtag));
		}
	}
};

var Pagingform = function(url) {
	var pageurl = url;
	var pageform = $('<form id="pageform"></form>');
	this.addParameter = function(name, value) {
		pageform.append($('<input type="hidden" name="' + name + '" value="' + value + '" />'));
	}, this.go = function(pageIndex) {
		this.addParameter('startIndex', pageIndex);
		common.goUrl(pageurl, "container", pageform.serialize());
	};
};
