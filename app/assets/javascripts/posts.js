$(document).on("ready", function () {
	console.log("HI")
	$('.before').delegate('.liked', 'click', function (event) {
		event.preventDefault();
		var id = $(this).data('id')
		unlikePost(id);
	});

	$('.before').delegate('.unliked', 'click', function (event) {
		event.preventDefault();
		var id = $(this).data('id')
		likePost(id);
	});
});


function unlikePost(id) {
	var postId = id;
	$.ajax ({
		url: `/posts/${postId}/unlike`,
		type: "POST",
		success: function(response) {
			$(`.div-${response.id}`).empty();
			console.log(response)
			showUnlike(response)
		},
		error: function(){
			console.log("Cry");
		}
	});
}

function showUnlike(response) {
	var html = `
	<a href="/posts/${response.id}/like" data-method="post" class="unliked" data-id="${response.id}" data-remote="true">
		<i id="post-${response.id}" class="grey-text mdi mdi-heart-outline"> favorite</i>
	</a>
	`
	$(`.div-${response.id}`).append(html);
}

function likePost(id) {
	var postId = id;
	$.ajax ({
		url: `/posts/${postId}/unlike`,
		type: "POST",
		success: function(response) {
			$(`.div-${response.id}`).empty();
			console.log(response)
			showLike(response);
		},
		error: function(){
			console.log("Cry");
		}
	});
}

function showLike(response) {
	var html = `
	<a href="/posts/${response.id}/unlike" data-method="post" class="liked" data-id="${response.id}" data-remote="true">
		<i id="post-${response.id}" class="red-text mdi mdi-heart"> favorited</i>
	</a>
	`
	$(`.div-${response.id}`).append(html);
}