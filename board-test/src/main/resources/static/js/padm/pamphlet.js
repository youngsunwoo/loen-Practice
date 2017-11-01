/*************************************************
 * File name   : pamphlet.js
 * Description : 구매 파트 공통 js
 * author      : hrkim
 * history     : 2014-03-03, 최초 작성, 멜론3.0 MLCP 웹개편
 *************************************************/
var CM = {};
(function($, undefined) {
	"use strict";


	// 공통 유틸 스크립트 정리
	var ruleRegex = /^(.+?)\(([^\)]+)\)?$/,
		numericRegex = /^[0-9]+$/,
		integerRegex = /^\-?[0-9]+$/,
		floatRegex = /^\-?[0-9]*\.?[0-9]+$/,
		emailRegex = /[\S]+@[\w-]+(.[\w-]+)+/,
		alphaRegex = /^[a-z]+$/i,
		alphaNumericRegex = /^[a-z0-9]+$/i,
		alphaDashRegex = /^[a-z0-9_\-]+$/i,
		numberRegex = /^[1-9][0-9]+$/i,
		numericDashRegex = /^[0-9\-]+$/,
		urlRegex = /^(http|https|ftp)\:\/\/[a-z0-9\-\.]+\.[a-z]{2,3}(:[0-9]*)?\/?[a-z0-9\-\._\?\,\'\/+&amp;%\$#\=~]*$/i,
		phoneRegex = /^[0-9]{2,4}\-?[0-9]{3,4}\-?[0-9]{4}$/i,
		korRegex = /^[가-힝]+$/;

	/**
	 * @namespace
	 * @name CM.util
	 * @description
	 */
	 CM.util = {

		/**
		 * 글자 byte 를 계산한다
		 */
		text_byte: function(text) {
			if (text) {
				var length = 0,
					charCode = -1,
					idx = 0,
					limit = text.length;
				for (; idx < limit; idx++) {
					charCode = text.charCodeAt(idx);
					if (charCode > 128) {
						length += 2;
					} else {
						length++;
					}
				}
				return length;
			}
			return 0;
		},

		/**
		 * 링크 체크
		 */
		url_regex: function(value) {
			return urlRegex.test(value);
		},

		/**
		 * 알파벳+숫자 체크
		 */
		alpha_numeric: function(value) {
			return alphaNumericRegex.test(value);
		},

		/**
		 * 숫자 체크
		 */
		numeric: function(value) {
			return numericRegex.test(value);
		},

		/**
		 * 한글+알파벳 체크
		 */
		kor_alpha: function(value) {
			return (korRegex.test(value) || alphaRegex.test(value));
		},

		/**
		 * 오른쪽 글자 붙이기
		 */
		right_pad: function(str, size, padChar) {
			if (!str) return null;
			if (!padChar) padChar = ' ';
			var pads = size - str.length();
	        if (pads <= 0) {
	        	return str;
	        }
	        return str.concat(this.padding(pads, padChar));
		},

		/**
		 * 왼쪽 글자 붙이기
		 */
		left_pad: function(str, size, padChar) {
			if (!str) return null;
			if (!padChar) padChar = ' ';
			var pads = size - str.length;
			if (pads <= 0) {
				return str;
			}
			return this.padding(pads, padChar).concat(str);
		},

		/**
		 * 크기만큼 글자 정렬시키기
		 */
		padding: function(repeat, padChar) {
			if (repeat < 0) {
				return null;
			}
			var buf = [repeat];
			for (var i = 0; i < buf.length; i++) {
	            buf[i] = padChar;
	        }
			return new String(buf);
		}
	 };

	/**
	 * @namespace
	 * @name CM.alert
	 * @description
	 */
	 CM.date = {

		/**
		 * 기간 구하기
		 */
		day_interval: function(sDate, eDate) {

			if (!sDate || !eDate) {
				return null;
			}
			var sLength = sDate.length,
				eLength = eDate.length;

			if (sLength < 12) {
				sDate = CM.util.left_pad(sDate,12,'0');
			}
			if (eLength < 12) {
				eDate = CM.util.left_pad(eDate,12,'0');
			}

			var startDate = this.to_date(sDate);
			var endDate = this.to_date(eDate);
			var day = 1000 * 3600 * 24;
			var termDate = parseInt((endDate - startDate) / day, 10);

			return termDate;
		},

		/**
		 * 문자열을 Date 타입으로 바꾼다
		 */
		to_date: function(date) {
		    var year  = date.substr(0,4);
		    var month = date.substr(4,2) - 1;
		    var day   = date.substr(6,2);

		    return new Date(year,month,day);
		}

	 };

	/**
	 * @namespace
	 * @name CM.css
	 * @description 디자인 관련
	 */
	CM.css = {

		/**
		 * 커서 over 동작 바꾸기
		 */
		cursor: function($this, cursor) {
			$this.css({"cursor":cursor});
		},

		/**
		 * 링크 언더라인 (비)활성화 시키기
		 */
		underline: function($this, underline) {
			$this.css({"text-decoration":underline});
		}
	};


	/**
	 * @namespace
	 * @name CM.alert
	 * @description
	 */
	 CM.alert = function(msg) {
		if (msg) {
			alert(msg);
		} else {
			alert("오류");
		}
	 };

	/**
	 * @namespace
	 * @name CM.confirm
	 * @description
	 */
	 CM.confirm = function(msg, obj) {
		 if (msg) {
			 return confirm(msg);
		 } else {
			 return confirm("확인하시겠습니까?");
		 }
	 };

	 /**
	  * 필수 입력값 확인 모듈
	  */
	 CM.valid = function($form) {
		 if (!$form) return false;
		 var $valids = $form.find('valid'),
		 	valid = true;
		 $valids.each(function(index, e) {
			var names = $(this).attr('id').split(",");
			for (var i=0; i < names.length; i++) {
				if (!names[i]) continue;
				var $this = $form.find("[name='"+names[i]+"']"),
					value = $this.val(),
					maxlength = $this.attr('maxlength'),
					length = CM.util.text_byte(value),
					alt = $(this).text();
				if ($this && alt) {
					if (!value) {
						CM.alert("필수값 ["+alt+"]이(가) 존재하지 않습니다.");
						$this.focus();
						valid = false;
						return false;
					} else if (maxlength && maxlength < length) {
						CM.alert(alt+"의 최대 입력값 ["+maxlength+"] byte를 초과했습니다.");
						$this.focus();
						valid = false;
						return false;
					}
				}
			}
		 });
		 return valid;
	 };

})(jQuery);

$(function() {

	$("#pageList a").on('mouseover', function(e) {
		CM.css.underline($(this), "underline");
	});
	$("#pageList a").on('mouseout', function(e) {
		CM.css.underline($(this), "");
	});

	/**
	 * 이미지 모듈 추가
	 */
	CM.addImageModule = function() {
		var $module = $("#imageModule");

		// iframe에 업로드 폼 삽입 (IE의 액세스 거부 문제 해결)
		var $iframe = $('<iframe name="ID_innerAction" width="0" height="0" src="" style="display:none;"></iframe>').insertAfter($module.find('#file_open'));
		var iframeDocument = $iframe[0].contentWindow.document;
		iframeDocument.writeln('<html><head></head><body>');
		iframeDocument.writeln('<form id="uploadForm" method="POST" enctype="multipart/form-data">');
		iframeDocument.writeln('    <input type="file" name="uploadFile" />');
		iframeDocument.writeln('</form>');
		iframeDocument.writeln('</body></html>');
		iframeDocument.close();

		var $uploadForm = $(iframeDocument).find('#uploadForm');
		var $uploadFile = $uploadForm.find('[name=uploadFile]');

		// 업로드 파일 선택시
		$uploadFile.on('change', function() {
			if (!CM.isImage(this.value)) {
				CM.alert("이미지는 jpg, gif, png 파일만 사용할 수 있습니다.");
				return false;
			}

			// 업로드 서비스 호출
			$uploadForm.attr("target", "ID_innerAction");
			$uploadForm.attr("action", "/padm/pamphlet/admin/web/saleadmin_uploadFile.htm");
			$uploadForm.submit();

			$uploadFile.val("");

			/* IE 특성탐.
			 * $uploadForm.ajaxSubmit({
				url: "/commerce/pamphlet/admin/web/saleadmin_uploadFile.json",
				type: "post",
				dataType: "json",
				async: false,
				success: function(json) {
					var resultCode = json.RESULTCODE;
					if (resultCode=="0") {
						var imgUrl = json.imgUrl,
							imgPath = json.imgPath;
						if (imgUrl) {
							$("[name=banerImgUrl]").val(imgUrl);
							$("[name=banerImgPath]").val(imgPath);
							$("#image_thumb").html(CM.getImageThumbHtml(imgUrl));
						}
					} else {
						CM.alert("["+json.ERRORCODE+"] "+json.ERRORMSG);
					}
				},
				complete: function() {
					$uploadFile.val("");
				}
			});*/
		});

		// 찾아보기 버튼 클릭시
		$("#file_open").on('click', function() {
			$uploadFile.click();
		});

		return $module;
	};

	CM.uploadFileAfter = function(resultCode, errorCode, errorMsg, imgUrl, imgPath) {
		if (resultCode==="0") {
			if (imgUrl) {
				$("[name=banerImgUrl]").val(imgUrl);
				$("[name=banerImgPath]").val(imgPath);
				$("#image_thumb").html(CM.getImageThumbHtml(imgUrl));
			}
		} else {
			CM.alert("["+errorCode+"] "+errorMsg);
		}
	};

	/**
	 * 이미지 썸네일 HTML 획득
	 * @param imgUrl 이미지URL
	 */
	CM.getImageThumbHtml = function(imgUrl) {
		return '<img src="http://image.melon.co.kr'+imgUrl+'" alt="이미지 미리보기" style="width:100%;" />';
	};

	/**
	 * 파일명이 이미지인지 체크
	 * @param fileName 파일명
	 */
	CM.isImage = function(fileName) {
		if (fileName) {
			if (fileName.length >= 5) {
				var ext = fileName.substring(fileName.length-4, fileName.length).toUpperCase();
				if (ext.indexOf("JPG") > 0 || ext.indexOf("GIF") > 0 || ext.indexOf("PNG") > 0) {
					return true;
				}
			}
		}
		return false;
	};

	/**
	 * 모듈을 위로 이동
	 */
	CM.moveModuleUp = function() {
		var $module = $("#module");
		$module.prev().before($module);
	};

	/**
	 * 모듈을 아래로 이동
	 */
	CM.moveModuleDown = function() {
		var $module = $("#module");
		$module.next().after($module);
	};

	/**
	 * 입력값의 byte 를 계산하여 표시한다
	 */
	CM.updateTextByte = function($byte, $input) {
		var text = $input.val(),
			length = CM.util.text_byte(text),
			maxLength = $input.attr("maxlength");
		if (length > maxLength) {
			$byte.html("<span style='color:#FE0303;'>" + length + "</span>");
		} else {
			$byte.html("<span style='color:#73D032;'>" + length + "</span>");
		}
	};

	/**
	 * 매대 메뉴 노출 순서를 가져온다
	 */
	CM.getDpPositionType = function(index) {
		if (index == 0) {
			return "01";
		} else if (index == 1) {
			return "02";
		} else if (index == 2) {
			return "03";
		}
		return index;
	};

	/**
	 * 상세페이지로 이동한다
	 */
	CM.goDetail = function($form, action) {
		$form.attr("action", action);
		$form.submit();
	};

	/**
	 * 메뉴 상세페이지로 이동한다
	 */
	CM.goMenuDetail = function(menuId) {
		var $form = $("form[name='byFrm']");
		var action = "/padm/pamphlet/admin/web/saleadmin_informMenu.htm";
		$form.append("<input type='hidden' name='menuId' value='"+menuId+"' />");
		$form.append("<input type='hidden' name='act' value='U' />");
		CM.goDetail($form, action);
	};

	/**
	 * 배너 상세페이지로 이동한다
	 */
	CM.goBanerDetail = function(banerId) {
		var $form = $("form[name='byFrm']");
		var action = "/padm/pamphlet/admin/web/saleadmin_informBaner.htm";
		$form.append("<input type='hidden' name='banerId' value='"+banerId+"' />");
		$form.append("<input type='hidden' name='act' value='U' />");
		CM.goDetail($form, action);
	};

});