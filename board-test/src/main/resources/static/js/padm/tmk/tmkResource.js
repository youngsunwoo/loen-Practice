var TmkResource = (function (){
	function retrieveTmBase(tmId){
		return $.ajax({
			dataType: 'json',
			type: 'GET',
			data: {
				tmId : tmId
			},
			url: '/padm/promotion/web/login_retrieveTmBase.json'
		});
	}
	return {
		retrieveTmBase: retrieveTmBase
	};
})();