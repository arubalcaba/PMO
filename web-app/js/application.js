if (typeof jQuery !== 'undefined') {
	$(document).ready(function() {
		$("body").bind("click", function (e) {
			$('.dropdown-toggle, .menu').parent("li").removeClass("open");
		});
		$(".dropdown-toggle, .menu").click(function (e) {
			var $li = $(this).parent("li").toggleClass('open');
			return false;
		});
	});

	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
	
	
}
