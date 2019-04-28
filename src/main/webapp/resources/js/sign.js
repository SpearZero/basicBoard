var signService = (function(){
	
	function dupidChk(id, callback) {
		$.getJSON("/signup/results/"+id+".json",
			function(data) {
				if(callback) {
					callback(data);
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
		});
	}
	
	return {
		dupidChk : dupidChk
	}
})();