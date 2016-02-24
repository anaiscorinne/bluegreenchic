// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
$(window).bind('scroll', function() {
	var distanceFromTop = $(this).scrollTop();
	var headerHeight = $('.main-header').height() - $('.main-nav').height();
		if (distanceFromTop >= headerHeight) {
			$('#value-nav').addClass('fixed');
		}
		else {
			$('#value-nav').removeClass('fixed');
		}
	});
});



