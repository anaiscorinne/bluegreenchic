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

	$('.before').delegate('.liked-brand', 'click', function (event) {
		event.preventDefault();
		var id = $(this).data('id')
		unlikeBrand(id);
	});

	$('.before').delegate('.unliked-brand', 'click', function (event) {
		event.preventDefault();
		var id = $(this).data('id')
		likeBrand(id);
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

function unlikeBrand(id) {
	var brandId = id;
	$.ajax ({
		url: `/brands/${brandId}/unlike`,
		type: "POST",
		success: function(response) {
			$(`.div-${response.id}`).empty();
			console.log(response)
			showUnlikeBrand(response)
		},
		error: function(){
			console.log("Cry");
		}
	});
}

function showUnlikeBrand(response) {
	var html = `
	<a href="/brands/${response.id}/like" data-method="post" class="unliked-brand" data-id="${response.id}" data-remote="true">
		<i id="brand-${response.id}" class="grey-text text-darken-1 mdi mdi-heart-outline"><span class="favorite-text"> favorite</span></i>
	</a>
	`
	$(`.div-${response.id}`).append(html);
}

function likeBrand(id) {
	var brandId = id;
	$.ajax ({
		url: `/brands/${brandId}/unlike`,
		type: "POST",
		success: function(response) {
			$(`.div-${response.id}`).empty();
			console.log(response)
			showLikeBrand(response);
		},
		error: function(){
			console.log("Cry");
		}
	});
}

function showLikeBrand(response) {
	var html = `
	<a href="/brands/${response.id}/unlike" data-method="post" class="liked-brand" data-id="${response.id}" data-remote="true">
		<i id="brand-${response.id}" class="red-text mdi mdi-heart"><span class="favorite-text"> favorited</span></i>
	</a>
	`
	$(`.div-${response.id}`).append(html);
}



















