var LoginPromotion = function (loginPromoId, title, pocId, targetGubun, target, order, popupType, linkType, linkUrl, promoMsg,
		mobiActionType, promoStartDt, promoEndDt, updtrId, updtDate, regerId, regDate, promoChnl, promoBtnDsplyYn,
		promoBlockYn, promoBlockDays, promoBlockMsg, promoForceOpenYn, promoForceOpenDays,
		promoBlockBtnLabel, promoTargetGroup){
	"use strict";
	var
		_loginPromoId = ko.observable(loginPromoId),
		_title = ko.observable(title).extend({
			required: true,
			minLength: 3
		}),
		_pocId = ko.observable(pocId),
		_targetGubun = ko.observable(targetGubun),
		_target = ko.observable(target),
		_order = ko.observable(order),
		_popupType = ko.observable(popupType),
		_linkType = ko.observable(linkType),
		_linkUrl = ko.observable(linkUrl),
		_promoMsg = ko.observable(promoMsg),
		_mobiActionType = ko.observable(mobiActionType),
		_promoStartDt = ko.observable(promoStartDt),
		_promoEndDt = ko.observable(promoEndDt),
		_updtrId = ko.observable(updtrId),
		_updtDate = ko.observable(updtDate),
		_regerId = ko.observable(regerId),
		_regDate = ko.observable(regDate),
		_promoChnl = ko.observable(promoChnl),
		_promoBtnDsplyYn = ko.observable(promoBtnDsplyYn),
		_promoBlockYn = ko.observable(promoBlockYn),
		_promoBlockDays = ko.observable(promoBlockDays),
		_promoBlockMsg = ko.observable(promoBlockMsg),
		_promoForceOpenYn = ko.observable(promoForceOpenYn),
		_promoForceOpenDays = ko.observable(promoForceOpenDays),
		_promoBlockBtnLabel = ko.observable(promoBlockBtnLabel),
		_promoTargetGroup = ko.observable(promoTargetGroup)
	;

	var fullTarget = ko.computed(function(){
		return (_targetGubun()==='FIX'?'':'TMK')+ ' ' + _target();
	});

	var promoDts = ko.computed(function(){
		var YYYYMMDDHHMM_FORMET = 'YYYY년MM월DD일 hh시mm분';
		return moment(_promoStartDt()).format(YYYYMMDDHHMM_FORMET) + '~' +  moment(_promoEndDt()).format(YYYYMMDDHHMM_FORMET);
	});

	var status = ko.computed(function(){

		if( moment().isBetween(_promoStartDt(), _promoEndDt()) ){
			// 노출중
			return '노출중';
		}else if(moment().isAfter(_promoEndDt())){
			// 기간종료
			return '기간종료';
		}else if(moment().isBefore(_promoStartDt())){
			// 노출대기중
			return '노출대기중';
		}
	});

	var statusCss = ko.computed(function(){
		var _css;
		if( moment().isBetween(_promoStartDt(), _promoEndDt()) ){
			// 노출중
			_css = 'btn-success';
		}else if(moment().isAfter(_promoEndDt())){
			// 기간종료
			_css = 'btn-default';
		}else if(moment().isBefore(_promoStartDt())){
			// 노출대기중
			_css = 'btn-Info';
		}
		return _css;
	});

	var showMakeExpiredButton = ko.computed(function(){
		return  moment().isBetween(_promoStartDt(), _promoEndDt());
	});

	var showRmButton = ko.computed(function(){
		return  !moment().isBetween(_promoStartDt(), _promoEndDt()) &&
					'' !== _pocId();
	});

	var expirePromotion = function(data){
		if(data){
			LoginPromotionResource.expirePromotion(data);
		}
	};

	var rmPromotion = function(data){
		if(data){
			LoginPromotionResource.rmPromotion(data)
			.done(function(res){
				if( res.isUpdated ){
					$("td[data-loginpromoid='" + data.loginPromoId() + "']").parent('tr').hide();
					alert('삭제 되었습니다.');
				}
			});;
		}
	};

	var goUpdate = function(data){
		if(data){
			location.href="/padm/promotion/web/login_updateView.htm?loginPromoId="+data.loginPromoId();
		}
	};

	var autoActionCode = ko.computed(function(){
		var actionCode = 'ANDROID'===_pocId() ? '111' :
			('IPHONE'===_pocId() ? '108' : '');
		_mobiActionType(actionCode);
		return _mobiActionType();
	});
	
	var chnlLabel = ko.computed(function(){
		var chnlLabel = 'CHNL_LOGIN'===_promoChnl() ? '로그인' :
			('CHNL_WHOLE'===_promoChnl() ? '전체메뉴' : '');
		return chnlLabel;
	}); 

	var hostAndPath = function(){
		return ("WEB"===_pocId()) ?
				"http://www.melon.com/buy/event/tmk/index.htm" :
				"http://m.melon.com/buy/event/tmk/index.htm";
	}
	var errors = ko.validation.group([_title, _promoMsg]);

	return {
		loginPromoId:_loginPromoId,
		title:_title,
		pocId:_pocId,
		targetGubun:_targetGubun,
		target:_target,
		order:_order,
		popupType:_popupType,
		linkType:_linkType,
		linkUrl:_linkUrl,
		promoMsg:_promoMsg,
		mobiActionType:_mobiActionType,
		promoStartDt:_promoStartDt,
		promoEndDt:_promoEndDt,
		updtrId:_updtrId,
		updtDate:_updtDate,
		regerId:_regerId,
		regDate:_regDate,
		promoChnl:_promoChnl,
		promoBtnDsplyYn:_promoBtnDsplyYn,
		promoBlockYn: _promoBlockYn,
		promoBlockDays: _promoBlockDays,
		promoBlockMsg: _promoBlockMsg,
		promoForceOpenYn: _promoForceOpenYn,
		promoForceOpenDays: _promoForceOpenDays,
		promoBlockBtnLabel: _promoBlockBtnLabel,
		promoTargetGroup: _promoTargetGroup,
		fullTarget:fullTarget,
		promoDts:promoDts,
		status:status,
		statusCss:statusCss,
		showMakeExpiredButton:showMakeExpiredButton,
		showRmButton:showRmButton,
		expirePromotion:expirePromotion,
		rmPromotion:rmPromotion,
		autoActionCode:autoActionCode,
		goUpdate:goUpdate,
		errors:errors,
		hostAndPath:hostAndPath,
		chnlLabel:chnlLabel
	};
};