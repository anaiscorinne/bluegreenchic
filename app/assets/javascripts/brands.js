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
	$('.value-checkbox').on('click', filterBrands);
});

function filterBrands(event) {
	var valueId = $(this).data("value-id");
	var allValueIds = []
	$('.value-checkbox:checked').each(function(index, element){
		var valueId = $(element).data("value-id")
		allValueIds.push(valueId)
	})
		console.log(allValueIds)
	$.ajax({
		url: `/api/keyvalues/`,
		data: {valueIds: allValueIds},
		success: function (response) {
			var brands = response
			console.log("BRANDS", brands)
			$('.js-brand-class').hide();
			brands.forEach(function(brand, index) {
						var brandId = brand.id
						// if (index % 2 == 0 ) {
						// 	$('.responsive-img.right-align').addClass("brand-image-left");
						// 	$(`.js-brand-class[data-id="#${brand.id}"]`).show();
						// }
						// else {
						// 	$(`.js-brand-class[data-id="#${brand.id}"]`).addClass();
							$(`.js-brand-class[data-id="#${brand.id}"]`).show();
						
						// decided to only show when a brand matches the brandId
						// the api returns in order to not write SUPER long
						// html here.
						// $(`.js-brand-class[data-id="#${brand.id}"]`).show();
						
			})
		}
	})
}























