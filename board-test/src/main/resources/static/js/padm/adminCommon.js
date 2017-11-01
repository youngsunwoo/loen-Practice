/**
 *
 * ######################################## 공통 관련 ########################################
 *
 * */

	/** 버튼을 셋업한다*/
	function setButten(){
		$(this).bind('click',function(){
				if(!$(this).attr("addType")){ alert("설정값이상 !!"); return false; }

				if($(this).attr("addType")=='select'){
					if(!$(this).attr("sourceID") || !$(this).attr("targetID")){ alert("설정값이상 !!"); return false; }
					addSelect(this);

				}else if($(this).attr("addType")=='text'){
					if(!$(this).attr("sourceID") || !$(this).attr("targetID")){ alert("설정값이상 !!"); return false; }
					addInput(this);

				}else if($(this).attr("addType")=='submit'){
					submitForm($(this).attr("formName"));

				}else if($(this).attr("addType")=='popup'){
					if(!$(this).attr("name")){ alert("name 설정값이상 !!"); return false; }
					popup(this);

				}else if($(this).attr("addType")=='cancle'){
					submitForm($(this).attr("formName"));

				}else if($(this).attr("addType")=='close'){
					window.close();

				}else if($(this).attr("addType")=='addTR'){
					addTR(this);

				}
			}
		);
	}


	//search
	function submitForm(name)	{
		showParam(form);

		var form = $('form[name="'+name+'"]');
		var message = form.attr('message');
		var str = "저장";

		if(TEST(name, 'chk_rule')){
			if(message!='' && message != null){
				str = message;
				if(confirm('정말 '+str+'하시겠습니까?')){
						form.submit();
				}
				return false;
			}else{
				form.submit();
			}
		}
	}

	// Form Information
	function showParam(form){
		//alert(form.serialize());
	}

	// Window Open
	function popup(obj){
		var option = "location=no,menubar=no,resizable=no,width=500,height=400" ; //'scrollbars=yes, toolbar=no, menubar=no, location=no, directories=no, status=no, resizable=yes, width=500, height=400';

		window.open ("", $(obj).attr("name"), option);
		submitPopup($(obj).attr("formName"), $(obj).attr("name"));
	}

	//  Popup 에 Submit
	function submitPopup(formName, windowName)	{
		var form = $('form[name="'+formName+'"]');
		showParam(form);
		form.attr('target',windowName);
		form.submit();
		form.removeAttr('target');
	}

	// A테그등 선택 시 값을 가지고 PopUp 이동할 경우.
	function gotoPopup(num){
		$(this).bind('click', function(){

			var form = $('form[id="'+$(this).attr("formName")+'"]');

			var name = $(this).find('input').attr('name');
			form.find('[name="'+name+'"]').remove(); //기존값 삭제

			$(this).find('input').clone().appendTo(form);

			 popup(this);
		});
	}


	// A테그등 선택 시 값을 가지고 페이지 이동할 경우.
	function gotoView(num){
		$(this).bind('click', function(){
			var form = $('form[id="'+$(this).attr("formName")+'"]');
			form.empty();

			$(this).find('input').clone().appendTo(form);

			showParam(form);
			form.submit();
		});
	}


	// TR 추가
	function addTR(obj){
		// td 추가
		var sourceObj = $('[id="'+$(obj).attr("sourceID")+'"]');
		var targetObj = $('[id="'+$(obj).attr("targetID")+'"]');
//		alert(thisObj.sourceID);
//		alert(sourceObj.html());

		//추가 되는 TR에 보조기능을 추가한다.
		var srcHtml = $(sourceObj.html());
		srcHtml.attr("id",$(obj).attr("targetID")+"_TMP");
		addTRSub(srcHtml);

		// 기능 추가된 HTML을 추가한다.
		$(srcHtml).insertAfter(targetObj);
		//targetObj.after(sourceObj.html());
	}

	// TR추가 시 추가되는 TR에 삭제 기능 설정
	function addTRSub(srcHtml){
		srcHtml.find('span[addType="addTR"]').bind('click', function(){
			if(confirm('정말 삭제하시겠습니까?')){
				$(this).parent().parent().remove();
			}
		});
	}

	// Select Box 추가
	function addSelect(obj){
		var $segChk = true;
		var select = $('select[id="'+$(obj).attr("sourceID")+'"] option:selected');
		var target = $('input[id="'+$(obj).attr("targetID")+'"]');

		var index = $('select[id="'+$(obj).attr("sourceID")+'"] option').index($('select[id="'+$(obj).attr("sourceID")+'"] option:selected'));

		//인덱스가 0이면 안내문구 임으로 통과
		if(index <= 0){
			alert("먼저 선택해야 합니다.");
			return false;
		}

		if(target.length <= 0){
			//처음엔 그냥 저장
			addData(obj, select);

		}else{
			// 이미 선택된 값이 있는지 검사
			target.each(function(){
				if(this.value == select.val() && $segChk){
					$segChk = false;
				}
			});

			// 이미 선택된 값이 없으면 추가
			if($segChk){
				addData(obj, select);
			}else{
				alert(select.text()+"는 이미 선택되었습니다.");
			}

			$segChk = true;
		}
	}

	//Input Box 추가
	function addInput(obj){
		var $segChk = true;
		var select = $('input[id="'+$(obj).attr("sourceID")+'"]');
		var target = $('input[id="'+$(obj).attr("targetID")+'"]');

		//인덱스가 0이면 안내문구 임으로 통과
		if(select.val() == ""){
			alert("먼저 내용을 입력해야 합니다.");
			return false;
		}

		//그냥 저장
		addData(obj, select);

	}

	// Select Box 추가 Sub Function
	function addData(obj, select){
		var label = $('label[id="'+$(obj).attr("targetID")+'"]');
		var num = label.size()+1;
		var findName = $(obj).attr("targetID") + num;

		//Select 타입인지 Text 타입인지 구분하여 처리한다
		if($(obj).attr("addType")=='select'){
			$(obj).after('&nbsp;<label  id="'+$(obj).attr("targetID")+'" name="'+findName+ '">'+ select.text()
			 		 		 +'<a id="'+findName+'" >[X]</a>'
							 +'<input type="hidden" name="'+$(obj).attr("targetID")+'" id="'+$(obj).attr("targetID")+'" size="10" value="'+ select.val() +'"  />'
							 +', </label>');

		}else if($(obj).attr("addType")=='text'){
			$(obj).after('&nbsp;<label  id="'+$(obj).attr("targetID")+'" name="'+findName+ '">'+ select.val()
					 		 +'<a id="'+findName+'" >[X]</a>'
							 +'<input type="hidden" name="'+$(obj).attr("targetID")+'" id="'+$(obj).attr("targetID")+'" size="10" value="'+ select.val() +'"  />'
							 +', </label>');
			select.val('');
			//alert(thisObj.parent().html());
		}

		$('a[id="'+findName+'"]').bind('click',function(){
			if(confirm('정말 삭제하시겠습니까?')){
				$('label[name="'+findName+'"]').remove();
			}
		});

	}

	// Select Box 추가 Sub Function
	function addUpdateData(targetID, selectID, value){

		var thisObj = $('[targetID="'+targetID+'"]');
		var select  ;

		var addType = thisObj.attr('addType');
		if(addType=='select'){
			select  = $('[id="'+selectID+'"]').find('option[value="'+value+'"]');

		}else  if(addType=='text'){
			select  = $('[id="'+selectID+'"]');
			select.val(value);
		}

		thisObj.each(function(){
			addData(this, select);
		});

	}


	// check 타입을 선택 시 target에 지정된 엘리먼트를 disabled 처리한다. (isTrue 값에 따라 켜기/끄기 기능이 반전된다.)
	var chkDisabe = function(){
		$('[id="chk_disable"]').each(function(){
			$(this).bind('click',function(){
				var tr = $(this).parent().parent().parent().parent();
				var isChecked = this.checked;
				if($(this).attr("isTrue")=='on'){
					$('[id="'+$(this).attr("target")+'"]').each(function(){
						if(!isChecked) { $(this).attr('disabled','true'); $(this).val('');   }
						else { $(this).removeAttr('disabled');}
					});
				}else{
					$('[id="'+$(this).attr("target")+'"]').each(function(){
						if(isChecked) { $(this).attr('disabled','true'); $(this).val('');  }
						else { $(this).removeAttr('disabled');}
					});
				}
			});
		});

		$('[id="radio_disable"]').each(function(){
			$(this).bind('click',function(){
				var tr = $(this).parent().parent().parent().parent();
				//alert(this.checked);
				var isChecked = this.checked;

				if($(this).attr("isTrue")=='off'){
					$('[id="'+$(this).attr("target")+'"]').each(function(){
						  $(this).removeAttr('disabled');
						  $(this).val('');
					});
				}else{
					$('[id="'+$(this).attr("target")+'"]').each(function(){
						 $(this).attr('disabled','true');
					});
				}
			});
		});


		$('[id="radio_disable_dual"]').each(function(){
			$(this).bind('click',function(){
				var tr = $(this).parent().parent().parent().parent();

				$('[id="'+$(this).attr("onTarget")+'"]').each(function(){
					  $(this).removeAttr('disabled');
				});

				$('[id="'+$(this).attr("offTarget")+'"]').each(function(){
					  $(this).attr('disabled','true');
					  $(this).val('');
				});
			});
		});


	};



	// Window Open 오퍼ID 찾기
	var popupOffer = function (obj){
		var thisObj = $(obj);
		var option = "location=no,menubar=no,resizable=no,width=500,height=400";

		var offerId = $('#offerId').val();
		var refOfferId = $('#refOfferId').val();

		if(refOfferId != '') {
			offerId = refOfferId;
		}
		if(offerId==''){
			alert('오퍼ID를 입력하세요');
			return false;
		}else{
			$('[name="offerId"]').val(offerId);
		}
		//alert('offerId='+$('[name="offerId"]').val());

		window.open ("", $(obj).attr("name"), option);
		submitPopup($(obj).attr("formName"), $(obj).attr("name"));
	};

	// Window Open 프로모션ID 찾기
	var popupPromotion = function (obj){
		var thisObj = $(obj);
		var option = "location=no,menubar=no,resizable=no,width=500,height=400";

		var promoId = $('#promoId').val();

		if(promoId==''){
			alert('프로모션ID를 입력하세요');
			return false;
		}else{
			$('[name="promoId"]').val(promoId);
		}
		//alert('promoId='+$('[name="promoId"]').val());

		window.open ("", $(obj).attr("name"), option);
		submitPopup($(obj).attr("formName"), $(obj).attr("name"));
	};

	// Window Open 상품 찾기
	var popupProduct = function (obj){
		//var option = "location=no,menubar=no,resizable=no,width=500,height=400";
		var option = 'scrollbars=1, toolbar=0, menubar=0, location=0, directories=0, status=0, resizable=yes, width=600, height=400';

		var thisObj = $(obj);
		var prodName = thisObj.parent().find('#prodName').val();
		//var priceFreeYn = thisObj.parent().find('#priceFreeYn').val();
		var priceFreeYn = thisObj.parent().find("input[name='priceFreeYn']:checked").val();
//		var value = $('input[name="'+obj.attr('name')+'"]:checked').val();//

		if(prodName==''){
			alert('상품명을 입력하세요');
			return false;
		}else{
			var actionFromName = $('#form3').find('[name="actionFormName"]').val();

			$('#form3').find('[name="prodName"]').val(prodName);
			$('#form3').find('[name="priceFreeYn"]').val(priceFreeYn);
			//alert($('#form3').find('[name="prodName"]').val());
		}

		window.open ("", $(obj).attr("name"), option);
		submitPopup($(obj).attr("formName"), $(obj).attr("name"));
	};


	// 업데이트시 DB에서 읽어온값을  셀렉트박스에 셋팅
	function setSelectBox(id, value){
		$('select[id="'+id+'"] option[value="'+value+'"]').attr('selected','selected');

	}

	// 업데이트시 DB에서 읽어온값을  셀렉트박스에 셋팅
	function setSelectBoxObjct(obj, name, value){
		obj.find('select[name="'+name+'"] option[value="'+value+'"]').attr('selected','selected');

	}

 /**
  *
  * ######################################## validation 관련 ########################################
  *
  * */

 /* --------------------------------------------------
 벨리데이션 체크 실행 함수
 ------------------------------------------------*/
	function TEST(formName,ruleName){
		/*
		* 유효값체크구문
		* 검사할개체아이디:실행함수1,실행함수2,..실행함수n #인수1 #인수2..
		"name:isEmpty"
		"id:isEmpty"
		"pwd:isEmpty,isNumber"
		"re_pwd:isEmpty,isNumber,eqVal#pwd#re_pwd" //인수pwd ,re_pwd
		"tel:isEmpty,isNumber"
		"email:isEmail"
		"ssn1:isEmpty,isNumber"
		"ssn2:isEmpty,isNumber,isSSN#ssn1#ssn2"
		*/

		var chk_form = $('[name="'+formName+'"]');
		//// var chk_objs = chk_form.find('[chk_rule][disabled=false]');	// [disabled=false] 수정 - 황성환 2014.06.03
		var chk_objs = chk_form.find('[chk_rule][disabled!=disabled]');

		if(ruleName == null || ruleName == '' ) ruleName = 'chk_rule';
		var isValide = validateForm(chk_objs,ruleName);

		if(isValide){
			//alert("validate success!!");
			//console.log("validate success!!");
		}
		return isValide;
	}

	//통합 폼 유효성 검사
	function validateForm(chk_objs, ruleName){

		var validate = true; // 이 값이 false 가되면 전체 경고창을 띠우고 루프문을 빠져나간다.

		//@분리한것들 루프돌리기
		chk_objs.each( function(index){
			if(!validate) return false;

			var obj 		= $(this); // 속성을 검사할 객체다.
			var fn_list 	= obj.attr(ruleName).split(","); // 함수리스트다 ,로 다시 쪼갠다.

			//함수들 루프돌리자!
			$.each(fn_list , function(index , fns){
				var args = fns.split("#"); //#으로 쪼개서 두번째거부턴 인수다.
				var fn = args[0]; // 실행함수 문자열

				//유효성 체크시작 문자열로 비교해 해당하는 함수 실행
				if(fn == "isEmpty"){//값이 없는경우 체크하는 함수
					validate = isEmpty(obj);

				}else if(fn == "isNumber"){//값이 숫자만 인지 체크
					validate = isNumber(obj);

				}else if(fn == "isNumberMin"){//값이 숫자 Min 보다 큰지 체크
						validate = isNumberMin(obj, args[1]);

				}else if(fn == "isNumberMax"){//값이 숫자 Max 보다 작은지 체크
						validate = isNumberMax(obj, args[1]);

				}else if(fn == "isNumberMinMax"){//값이 숫자 Min 보다 크고  Max 보다 작은지 체크
						validate = isNumberMinMax(obj, args[1], args[2]);

				}else if(fn == "eqVal"){//두 값이 같은지 체크하는 함수
					validate = eqVal($('#'+args[1]) , $('#'+args[2]));

				}else if(fn == "isEmail"){//유효한 이메일인지 체크
					validate = isEmail(obj);

				}else if(fn == "isSSN"){//유효한 주민번호인지 체크
					validate = isSSN($('#'+args[1]) , $('#'+args[2]));

				}else if(fn == "isSelect"){//셀렉트 박스 선택여부 체크
					validate = isSelect(obj);

				}else if(fn == "isAdd"){//셀렉트 박스 선택여부 체크
					validate = isAdd(obj);

				}else if(fn == "isRadioChecked"){//라디오 버튼 선택 여부  체크하는 함수
					validate = isRadioChecked(obj);

				}else if(fn == "isAddAtTheSeg"){//라디오 버튼 선택 여부  체크하는 함수
					validate = isAddAtTheSeg(obj);

				}else if(fn == "isAddAtTheOffer"){//오퍼 등록 시 선택하여 추가됐는지  체크하는 함수
					validate = isAddAtTheOffer(obj);

				}else if(fn == "isValidDate"){//yyyy.mm.dd 형식의 날짜값을 입력받아서 유효한 날짜인지 체크한다.
					validate = isValidDate(obj);

				}else if(fn == "isNumberUAlphabet"){
					validate = isNumberUAlphabet(obj);

				}

				//함수실행후 false 가 나오면 적당한 alert 띠우고 해당객체에 포거스 주고 빠져나간다.
				if(!validate){

					if(message[fn] != null){
						alert(message[fn]);
					}

					if(obj.attr('sourceID') != null){
						$('[id="'+obj.attr('sourceID')+'"]').focus();
					}else{
						obj.focus();
					}
					return false;
				}
			});

		});

		return validate;
	}

	//alert 창 띄울떄 쓰는 메시지들 함수명이랑 맞춘다.
	var message = 	{
	    				"isEmpty":"필수 값을 입력해야 합니다."
		    			,"isNumber":"숫자만 입력할수 있습니다."
		    			,"eqVal":"두 값이 동일하지 않습니다."
		    			,"isEmail":"유효하지 않은 이메일 주소입니다."
		    			,"isSSN":"유효하지 않은 주민번호입니다."
		    			,"isSelect":"리스트박스를 선택해야 합니다."
		    			,"isAdd":"1개 이상 추가해야 합니다."
		    			,"isRadioChecked":"라디오 버튼을 1개 이상 선택해야 합니다."
	    				,"isAddAtTheSeg":"1번 이상 추가해야 합니다."
	    				,"isAddAtTheOffer":"조정 시점/조정 금액 1개 이상 추가해야 합니다."
	    				//,"isNumberMin":"최소값보다 값이 적습니다."
	    				//,"isNumberMax":"최대값보다 값이 큼습니다."
	    				,"isNumberMinMax":"값이 최대 최소값 이내 여야 합니다."
	    				,"isValidDate":"날짜형식은 'YYYY.MM.DD'형식으로 입력해야 합니다."
	    				,"isNumberUAlphabet":"숫자 혹은 알파벳 대문자만 입력할 수 있습니다."
					};




	 /* --------------------------------------------------
	 * yyyymmdd 형식의 날짜값을 입력받아서 유효한 날짜인지 체크한다.
	 * ex) isValidDate("20070415");
	 ------------------------------------------------*/

	function isValidDate(iDate) {
		var iDate = iDate.replace(/[.]/g, '');
	  if( iDate.length != 8 ) {
	    return false;
	  }

	  var oDate = new Date(Number(iDate.substring(0, 4)), Number(iDate.substring(4, 6)), Number(iDate.substring(6)));

//	  if( oDate.getFullYear()     != Number(iDate.substring(0, 4))
//	      || oDate.getMonth()     != Number(iDate.substring(4, 6))
//	      || oDate.getDate()      != Number(iDate.substring(6)) ) {
//
//		  alert(oDate.getYear()+" / "+Number(iDate.substring(0, 4)));
//		  alert(oDate.getMonth()+" / "+Number(iDate.substring(4, 6)));
//		  alert(oDate.getDate()+" / "+Number(iDate.substring(6)));
//
//	    return false;
//	  }

	  return true;
	}


	 /* --------------------------------------------------
	   라디오 버튼 선택 여부  체크하는 함수
	 ------------------------------------------------*/
	function isRadioChecked(obj){
		var value = $('input[name="'+obj.attr('name')+'"]:checked').val();//
		return value != null;
	}

	 /* --------------------------------------------------
	  오퍼 등록 시 선택하여 추가됐는지  체크하는 함수
	 ------------------------------------------------*/
	function isAddAtTheOffer(obj){
		var len = obj.parent().find('#TMP').size();//
		return len > 0;
	}

	 /* --------------------------------------------------
	  세그먼트 등록 시 선택하여 추가됐는지  체크하는 함수
	 ------------------------------------------------*/
	function isAddAtTheSeg(obj){
		var len = obj.parent().find('#TMP').size();//
		return len > 0;
	}

	 /* --------------------------------------------------
	   선택하여 추가됐는지  체크하는 함수
	 ------------------------------------------------*/
	function isAdd(obj){
		var len = $('input[name="'+obj.attr('targetID')+'"]').length;//
		return len > 0;
	}

	 /* --------------------------------------------------
	   값이 없는경우 체크하는 함수
	 ------------------------------------------------*/
	function isEmpty(obj){
		return $.trim (obj.val()) != "";
	}

	 /* --------------------------------------------------
	   두 값이 같은지 체크하는 함수
	 ------------------------------------------------*/
	function eqVal(obj1 , obj2){
		return obj1.val() == obj2.val();
	}

	 /* --------------------------------------------------
	   값이 숫자 Min 보다 크고  Max 보다 작은지 체크
	 ------------------------------------------------*/
	function isNumberMinMax(obj, min, max){
		if(!isNumberMin(obj, min)) return false;
		if(!isNumberMax(obj, max)) return false;

		return true;
	}

	 /* --------------------------------------------------
	  값이 숫자 Min 보다 큰지 체크
	 ------------------------------------------------*/
	function isNumberMin(obj, min){
		if(obj.val()=='') return true;

		var objValue = isNumber(obj);
		var minValue = isNumberStr(min);
		var result = false;

		if(objValue && minValue){
			result = Number(min) <= Number(obj.val());
			if(!result){ alert('최소값 '+min+'보다 값이 적습니다.'); }
		}else{
			alert('"'+ obj.val()+'" 은 숫자가 아님니다.');
		}

		return result;
	}

	 /* --------------------------------------------------
	  값이 숫자 Max 보다 작은지 체크
	 ------------------------------------------------*/
	function isNumberMax(obj, max){
		if(obj.val()=='') return true;

		var objValue = isNumber(obj);
		var maxValue = isNumberStr(max);
		var result = false;

		if(objValue && maxValue){
			result = Number(max) > Number(obj.val());
			if(!result){('최대값 '+max+'보다 값이 큼습니다.'); }
		}else{
			alert('"'+ obj.val()+'" 은 숫자가 아님니다.');
		}

		return result;
	}

	 /* --------------------------------------------------
	  값이 숫자만 인지 체크
	 ------------------------------------------------*/
	function isNumber(obj){
	   var reg = /^\d+$/;
		return reg.test(obj.val());
	}

	 /* --------------------------------------------------
	  값이 숫자만 인지 체크
	 ------------------------------------------------*/
	function isNumberStr(str){
	   var reg = /^\d+$/;
		return reg.test(str);
	}
	 /* --------------------------------------------------
	  유효한 이메일인지 체크
	 ------------------------------------------------*/
	function isEmail(obj){
		var reg = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
		return reg.test(obj.val());
	}

	 /* --------------------------------------------------
	  유효한 주민번호인지 체크
	 ------------------------------------------------*/
	function isSSN(obj1 , obj2){
		var jumin = obj1.val()+obj2.val();

	   if (jumin.length != 13)  return false;

	   var tval = 	 jumin.charAt(0)*2 + jumin.charAt(1)*3 + jumin.charAt(2)*4
	   			+ jumin.charAt(3)*5 + jumin.charAt(4)*6 + jumin.charAt(5)*7
	   			+ jumin.charAt(6)*8+ jumin.charAt(7)*9 + jumin.charAt(8)*2
	   			+ jumin.charAt(9)*3 + jumin.charAt(10)*4 + jumin.charAt(11)*5;

	   var tval2 = 11- (tval % 11);
	   var tval2 = tval2 % 10;

		return (jumin.charAt(12) == tval2 && (jumin.charAt(6) == "1" || jumin.charAt(6) == "2"));
	}


	 /* --------------------------------------------------
	 셀렉트 박스 선택여부 체크
	 ------------------------------------------------*/
	function isSelect(obj){
		var reg = obj.find('option:selected').val(); //  obj
		return (reg != '0');
	}

	 /* --------------------------------------------------
	 알파벳인지 체크
	 ------------------------------------------------*/
	 function isAlphabet(ch) {
		  var numUnicode = ch.charCodeAt(0); // number of the decimal Unicode
		  if ( 65 <= numUnicode && numUnicode <= 90 ) return true;            // 대문자
		  if ( 97 <= numUnicode && numUnicode <= 122 ) return true;            // 소문자
		  return false;
	 }

	 /* --------------------------------------------------
	 숫자, 알파벳 대문자 인지 체크
	 ------------------------------------------------*/
	 function isNumberUAlphabet(obj) {
		 var str = obj.val();
		 var strLen = str.length;
		 if (strLen > 0) {
		     for (var i=0; i<strLen; i++){
		    	 numUnicode = str.charCodeAt(i);
		          if (!((65 <= numUnicode && numUnicode <= 90) || ( 48 <= numUnicode && numUnicode <= 57 ))){
		        	  return false;
		          }
		     }
		 return true;
		 }
	 }

	 /* --------------------------------------------------
	 한글인지 체크
	 ------------------------------------------------*/
	 function isKorean(ch) {
	  var numUnicode = ch.charCodeAt(0);
	  if ( 44032 <= numUnicode && numUnicode <= 55203 || 12593 <= numUnicode && numUnicode <= 12643 ) return true;
	 return false;
	 }

	 /* --------------------------------------------------
	 숫자인지 체크
	 ------------------------------------------------*/
	 //function isNumber(ch) {
	 // var numUnicode = ch.charCodeAt(0);
	 // if ( 48 <= numUnicode && numUnicode <= 57 ) return true;
	 //return false;
	 //}

	 /* --------------------------------------------------
	마지막 글자 추출
	 ------------------------------------------------*/
	 function lastLan(val){
	  var length = val.length;
	  var str = val.substr(length-1,length);
	  return str;
	 }

 /**
  *
  * ######################################## 달력 관련 ########################################
  *
  * */

var datePick = function(){
	$.datepicker.setDefaults({
	    prevText: '이전달',
	    nextText: '다음달',
	    monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear:true,
	    dateFormat: 'yy.mm.dd',
	    buttonImageOnly: true,
	    buttonText: "달력",
	    showOtherMonths: true,
	    buttonImage: "/resource/image/common/calender.gif"
	});
    // 달력 - 시작일
    $('#date_start').datepicker({
        //dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sEndDate = jQuery.trim($('#date_end').val());
            if (sEndDate.length>0) {
                var iEndDate   = parseInt(sEndDate.replace(/[.]/g, ''));
                var iStartDate = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));

                if (iStartDate>iEndDate) {
                    alert('시작일보다 종료일이 과거일 수 없습니다.');
                    $('#date_start').val('');
                }
            }
        }
    });
    $('#img_date_start').click(function() {$('#date_start').focus();});

    // 달력 - 종료일
    $('#date_end').datepicker({
        //dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sStartDate = jQuery.trim($('#date_start').val());
            if (sStartDate.length>0) {
                var iStartDate = parseInt(sStartDate.replace(/[.]/g, ''));
                var iEndDate  = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));

                if (iStartDate>iEndDate) {
                    alert('시작일보다 종료일이 과거일 수 없습니다.');
                    $('#date_end').val('');
                }
            }
        }
    });
    $('#img_date_end').click(function() {$('#date_end').focus();});


    // 달력 - 시작일2
    $('#date_start1').datepicker({
        //dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sEndDate = jQuery.trim($('#date_end2').val());
            if (sEndDate.length>0) {
                var iEndDate   = parseInt(sEndDate.replace(/[.]/g, ''));
                var iStartDate = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));

                if (iStartDate>iEndDate) {
                    alert('시작일보다 종료일이 과거일 수 없습니다.');
                    $(this).val('');
                }
            }
        }
    });
    $('#img_date_start').click(function() {$('#date_start1').focus();});

    // 달력 - 종료일2
    $('#date_end2').datepicker({
        //dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var sStartDate = jQuery.trim($('#date_start1').val());
            if (sStartDate.length>0) {
                var iEndDate  = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));
                var iStartDate = parseInt(sStartDate.replace(/[.]/g, ''));

                if (iStartDate>iEndDate) {
                    alert('시작일보다 종료일이 과거일 수 없습니다.');
                    $(this).val('');
                }
            }
        }
    });
    $('#img_date_end').click(function() {$('#date_end2').focus();});
 }




//달력 - 시작일2
var autoDate = function(){
	$('input[id^="autoDate"]').each(function(){
		$(this).datepicker({
	        //onSelect: isValidFick,
	        onClose: function (dateText, inst) {
	        	//<input type="text" id="autoDate1" targetID="autoDate2" isStart="Y"  size="10" readonly /> ~ <input type="text" id="autoDate2" targetID="autoDate1" isStart="N"  size="10" readonly  />

	        	var statID;
	        	var  endID;
	        	if($(this).attr("isStart") == 'Y'){
	        		statID = $(this).attr("id");
	        		endID  = $(this).attr("targetID");
	        	}else if($(this).attr("isStart") == 'N'){
	        		statID = $(this).attr("targetID");
	        		endID  = $(this).attr("id");
	        	}else{
	        		alert("isStart 설정이 잘못 됐습니다.");
	        	}

	            var sStartDate = jQuery.trim($('input[id="'+statID+'"]').val());
	            var sEndDate = jQuery.trim($('input[id="'+endID+'"]').val());

	            if(dateText.length>0 && !isValidDate(dateText)){
	            	alert("날짜형식은 'YYYY.MM.DD'형식으로 입력해야 합니다.");
                    $(this).val('');
                    $(this).focus();
	            	return false;
	            }

	            if (sStartDate.length>0) {
	                var iStartDate = parseInt(sStartDate.replace(/[.]/g, ''));
	                var iEndDate  = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));

	                if (iStartDate>iEndDate) {
	                    alert('시작일보다 종료일이 과거일 수 없습니다.');
	                    $(this).val('');
	                    $(this).focus();
	                    return false;
	                }

	            }
	            if (sEndDate.length>0) {
	                var iStartDate = parseInt(jQuery.trim(dateText).replace(/[.]/g, ''));
	                var iEndDate   = parseInt(sEndDate.replace(/[.]/g, ''));

	                if (iStartDate>iEndDate) {
	                    alert('시작일보다 종료일이 과거일 수 없습니다.');
	                    $(this).val('');
	                    $(this).focus();
	                    return false;
	                }
	            }
	        }
	    });
	});
};

/**
 *
 * ######################################## 유틸 ########################################
 *
 * */

var toJson = function(str){
	if(str.length <= 0 && str =='' && isNaN()) null;

	var arr = str.split('&');
	var size = arr.length;
	var tmp;
	var result ='{';
		for(i=0;i<size;i++){
			if(i>0) result += ",";

			tmp = arr[i].split('=');
			result+= '"'+tmp[0]+'":"'+tmp[1]+'"';
		}
		result +='}';

	return jQuery.parseJSON(result);
};


// formName1 정보를  targetName 에 추가한다.( Form1 + From2 = targetFrom )
var addForm = function(formName1, targetName) {
	var targetForm = $('form[id="' + targetName + '"]');
	var form1 = $('form[id="' + formName1 + '"]');
	var form1_serial = form1.serialize();

	//alert("form1_serial="+form1_serial);

	if(form1.size()<=0){ alert("formName1 값이 존재하지 않습니다."); return false;}
	if(targetForm.size()<=0){ alert("targetName 값이 존재하지 않습니다."); return false;}

	//var parm = toJson(form1_serial);
	var parm = form1_serial.split('&');
	var objs, keyValue, key, value;

	for ( var i=0; i < parm.length;i++) {
	//for ( var key in parm) {
		keyValue = parm[i].split('=');
		key = keyValue[0];
		value = keyValue[1];

		objs = $('<input></input>');
		objs.attr('type', 'hidden');
		objs.attr('name', key);
		//alert(" unescape(decodeURIComponent=> "+unescape(decodeURIComponent(value))  );
		objs.attr('value',  unescape(decodeURIComponent(value)).replace(/\+/g, " ")  ); //decodeURI() decodeURIComponent ()
		//objs.attr('value',  decodeURIComponent(value) ); //decodeURI() decodeURIComponent ()
		objs.appendTo(targetForm);
	}
};



// 2개의 From 정보를 Merge하고 Target From에 추가한다.( Form1 + From2 = targetFrom )
var mergeForm = function(formName1, formName2, targetName) {
	var targetForm = $('form[id="' + targetName + '"]');
	var form1 = $('form[id="' + formName1 + '"]');
	var form2 = $('form[id="' + formName2 + '"]');

	var str = '';
	var form1_serial = form1.serialize();
	var form2_serial = form2.serialize();

	if(targetForm.size()<=0){ alert(targetName+" 이 존재하지 않습니다."); return false;}
	if(form1.size()<=0){ alert(formName1+" 이 존재하지 않습니다."); return false;}
	if(form2.size()<=0){ alert(formName2+" 이 존재하지 않습니다."); return false;}


	if (form1_serial.length >= 0 && form1_serial != '') {
		if (str.length > 0)
			str += "&";
		str += form1_serial;
	}
	if (form2_serial.length >= 0 && form2_serial != '') {
		if (str.length > 0)
			str += "&";
		str += form2_serial;
	}


	//var parm = toJson(form1_serial);
	var parm = form1_serial.split('&');
	var objs, keyValue, key, value;

	for ( var i=0; i < parm.length;i++) {
	//for ( var key in parm) {
		keyValue = parm[i].split('=');
		key = keyValue[0];
		value = keyValue[1];

		objs = $('<input></input>');
		objs.attr('type', 'hidden');
		objs.attr('name', key);
		//alert(" unescape(decodeURIComponent=> "+unescape(decodeURIComponent(value))  );
		objs.attr('value',  unescape(decodeURIComponent(value)).replace(/\+/g, " ")  ); //decodeURI() decodeURIComponent ()
		objs.appendTo(targetForm);
	}
};



/**
 *
 * ######################################## paging 처리 ########################################
 *
 * */

function paging( submitFormId, totalCount, selectPage, showPageCount, showRowCount, targetURL ){

	  var targetPage = targetURL;
	  var formId     = submitFormId;

	  var nowPage    = (Number(selectPage) > 0) ?  Number(selectPage) : 1 ;
	  var pageSize   =  Number(showPageCount); // 2

	  var totalPage  =  parseInt((Number(totalCount) / Number(showRowCount)));
	      totalPage  = (Number(totalCount) % Number(showRowCount))>0 ? totalPage+1 : totalPage ;

	  var nowBlock = parseInt(nowPage/pageSize);
	      nowBlock = (nowPage%pageSize) > 0 ? nowBlock+1 : nowBlock;

	  var maxBlock =  parseInt(totalPage/pageSize);
	  	  maxBlock = (totalPage % pageSize)> 0 ?  maxBlock+1 : maxBlock;

	  var beforeBlockPage =  ((nowBlock-2)*pageSize)+1 ;
	  var nextBlockPage   =  ((nowBlock)*pageSize)+1 ;

	  var startPage  = ((nowBlock-1)*pageSize)+1;
	  var endPage    = startPage + pageSize;

	  if(maxBlock==nowBlock){
		  endPage = (totalPage % pageSize) > 0 ? startPage + (totalPage % pageSize) : startPage + pageSize;
	  }
	  if(totalCount==0) endPage = 0 ;

	  //alert(startPage+'~'+endPage);
	  var form ;

	  var ol = $('.paging>ol');
	  if(formId == ''){
		  ol.before('<form id="pagingForm"  method="get" ></form>');
		  form = $('form[id="pagingForm"]');
		  form.attr('action',targetPage);
	  }else{

		  form = $('form[id="'+formId+'"]');
	  }

	  var firstAtag  = $('<a href="#" id="1"><img src="/resource/image/ppn/btn_page_first.gif" alt="처음 목록으로" /></a>');
	  var preAtag    = $('<a href="#" id="'+beforeBlockPage+'"><img src="/resource/image/ppn/btn_page_prev.gif" alt="이전 목록으로" /></a>');
	  var endAtag    = $('<a href="#" id="'+totalPage+'"><img src="/resource/image/ppn/btn_page_last.gif" alt="끝 목록으로" /></a>');
	  var nextAtag   = $('<a href="#" id="'+nextBlockPage+'"><img src="/resource/image/ppn/btn_page_next.gif" alt="다음 목록으로" /></a>');

	  setLink(firstAtag, form);
	  setLink(preAtag, form);
	  setLink(endAtag, form);
	  setLink(nextAtag, form);

	  if(nowBlock > 1){
		  ol.before(firstAtag);
		  ol.before(preAtag);
	  }

	  for(var i=startPage ;i< endPage ;i++){
		   var aTag = $('<a></a>');
		   aTag.text(i);
		   aTag.attr('id', i);
		   if(Number(selectPage) != i){
			   setLink(aTag, form);
		   }
		   if(i==nowPage){ aTag.attr('class','on');  }
		   ol.append($('<li></li>').append(aTag));
	  }

	  if(nowBlock < maxBlock){
		  ol.after(endAtag);
		  ol.after(nextAtag);
	  }
}

 function setLink(aTag, form){
	   aTag.attr('href','#');
	   aTag.bind('click',function(){
		   setParam("selectPage", $(this).attr("id"), form);
		   //alert(this.id);
		   form.submit();
	   });
 }

 function setParam(name, value, form){
	 form.append($('<input type="hidden" name="'+ name +'" value="'+ value +'" />'));
 }
