
var LoginPromotionResource = (function (){
	function all(){
		transBtnToggle();
		return $.ajax({
			dataType: 'json',
			type: 'GET',
			url: '/padm/promotion/web/login_listAll.json'
		});
	}
	function listByPocId(promoPocId){
		transBtnToggle(promoPocId);
		return $.ajax({
			dataType: 'json',
			data:{promoPocId:promoPocId},
			type: 'GET',
			url: '/padm/promotion/web/login_listByPocId.json'
		});
	}
	function listByPromoChnlAndPocId(cap){
		transBtnToggle(cap.getPocId());
		return $.ajax({
			dataType: 'json',
			data:{
				promoPocId:cap.getPocId(),
				promoChnl:cap.getChnl()
			},
			type: 'GET',
			url: '/padm/promotion/web/login_listByPromoChnlAndPocId.json'
		});
	}
	function findById(loginPromoId){
		return $.ajax({
			dataType: 'json',
			data:{loginPromoId:loginPromoId},
			type: 'GET',
			url: '/padm/promotion/web/login_findById.json'
		});
	}
	function register(data){
		return $.ajax({
			dataType: 'json',
			data:ko.toJS(data),
			type: 'POST',
			url: '/padm/promotion/web/login_register.json'
		});
	}
	function update(data){
		return $.ajax({
			dataType: 'json',
			data:ko.toJS(data),
			type: 'POST',
			url: '/padm/promotion/web/login_update.json'
		});
	}
	function expirePromotion(data){
		if ( !confirm( "기간만료처리를 진행하시겠습니까?")) {
			return false;
		}
		return $.ajax({
			dataType: 'json',
			data: {loginPromoId:data.loginPromoId()},
			type: 'POST',
			url: '/padm/promotion/web/login_expire.json'
		}).done(function(res){
			if( res.isUpdated ){
				alert('기간 만료되었습니다.');
				data.promoEndDt(moment());
			}
		});
	}
	function rmPromotion(data){
		if ( !confirm( "삭제를 진행하시겠습니까?")) {
			return false;
		}
		return $.ajax({
			dataType: 'json',
			data: {loginPromoId:data.loginPromoId(), promoPocId: data.pocId() },
			type: 'POST',
			url: '/padm/promotion/web/login_rm.json'
		});
	}
	function transBtnToggle(promoPocId) {
		$("#destroy").trigger("click");
		if ( promoPocId == null ) {
			$('#transform, #purge').addClass('disabled');
			$('#transform, #purge').attr('disabled', true);
			$('#purge').hide();
		} else {
			$('#transform, #purge').removeClass('disabled');
			$('#transform, #purge').attr('disabled', false);
		}
	}
	function updateOrder(){
		var loginPromoIds = []
		,	pocIds = []
		,	orders = []
		,	dataFiled;

		$('tbody').children('tr').each(function() {
			dataFiled = $(this).find(".dataFiled");

			loginPromoIds.push($.trim(dataFiled.attr('data-loginpromoid')));
			orders.push($.trim(dataFiled.text()));
			pocIds.push($.trim(dataFiled.attr('data-pocid')));
		});

		return $.ajax({
			dataType: 'json',
			data: {
				loginPromoIds : loginPromoIds,
				promoPocIds : pocIds,
				promoOrders : orders
			},
			type: 'POST',
			url: '/padm/promotion/web/login_updateChangeOrder.json'
		});
	}
	function purgeCache(data){
		if ( !confirm( data.pocId + "(" + data.chnl +  ") 캐시삭제를 진행하시겠습니까?")) {
			return false;
		}
		return $.ajax({
			dataType: 'json',
			data: {
				pocId:data.pocId,
				chnl:data.chnl
			},
			type: 'POST',
			url: '/padm/promotion/web/login_purgeCache.json'
		}).done(function(res){
			if( res.isPurged ){
				alert('캐시삭제가 완료되었습니다.');
			}
		});
	}
	return {
		all: all,
		register: register,
		update: update,
		expirePromotion: expirePromotion,
		rmPromotion: rmPromotion,
		listByPocId: listByPocId,
		listByPromoChnlAndPocId:listByPromoChnlAndPocId,
		findById: findById,
		updateOrder: updateOrder,
		purgeCache: purgeCache
	};
})();