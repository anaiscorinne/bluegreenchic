// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
$(window).bind('scroll', function() {
	var distanceFromTop = $(this).scrollTop();
	var headerHeight = $('.main-header').height() - $('.main-nav').height();
		if (distanceFromTop >= headerHeight) {
			$('.js-extra-room').addClass('extra-room-show')
			$('#value-nav').addClass('fixed');
			$('.brand-search-bar').addClass('fixed-brand-search')
		}
		else {
			$('.js-extra-room').removeClass('extra-room-show')
			$('#value-nav').removeClass('fixed');
			$('.brand-search-bar').removeClass('fixed-brand-search')

		}
	});	
	$('.value-checkbox').on('click', filterBrands);
	$('.brand-search-form').on('click', function () {
		$('.brand-search-form').val("");
	});
});


function filterBrands(event) {
	var valueId = $(this).data("value-id");
	var allValueIds = []
	$('.value-checkbox:checked').each(function(index, element){
		var valueId = $(element).data("value-id")
		allValueIds.push(valueId)
	})
	$.ajax({
		url: '/api/keyvalues/',
		data: {valueIds: allValueIds},
		success: function (response) {
			var brands = response
			$('.js-brand-class').hide();
			brands.forEach(function(brand, index) {
				var brandId = brand.id
				$(`.js-brand-class[data-id="#${brand.id}"]`).show();
			})
		}
	})
}























