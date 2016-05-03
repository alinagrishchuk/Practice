/**
 * Created by ALINA on 30.04.2016.
 */
$(document).ready(function () {
	$('video').on('ended', function () {
		this.load();
		this.play();
	});
	
	$('a').click(function (e) {
		var hrefDest = $(this).attr("href");
		if (typeof $(hrefDest).offset === 'function') {
			var destOffset = $(hrefDest).offset().top;
			$('html,body').animate({scrollTop: destOffset}, 1000);
			return false;
		}
		return true;
	});
	
	$('#contact-form').submit(function( event ) {
		event.preventDefault();
	});


});
