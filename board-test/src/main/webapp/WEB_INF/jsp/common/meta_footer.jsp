<script type="text/javascript" src="/resource/js/common.js"></script>
<script type="text/javascript" src="/resource/js/padm/adminCommon.js"></script>
<script type="text/javascript">
	$(window).on('popstate', function(event) {
		try {
			var state = event.originalEvent.state;
			console.log('popstate:', state);
			if (state != null) {
				common.go(state.path);
			}
		} catch (err) {
			//not supported
		}
	});
</script>
