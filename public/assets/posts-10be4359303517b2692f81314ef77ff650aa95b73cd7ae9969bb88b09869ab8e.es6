$(document).on("ready", function () {
	console.log("HI")
	$('.before').delegate('.liked-post', 'click', function (event) {
		event.preventDefault();
		var id = $(this).data('id')
		unlikePost(id);
	});

	$('.before').delegate('.unliked-post', 'click', function (event) {
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
	<a href="/posts/${response.id}/like" data-method="post" class="unliked-post" data-id="${response.id}" data-remote="true">
		<i id="post-${response.id}" class="grey-text text-darken-1 mdi mdi-heart-outline"><span class="favorite-text"> favorite</span></i>
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
	<a href="/posts/${response.id}/unlike" data-method="post" class="liked-post" data-id="${response.id}" data-remote="true">
		<i id="post-${response.id}" class="red-text mdi mdi-heart"><span class="favorite-text"> favorited</span></i>
	</a>
	`
	$(`.div-${response.id}`).append(html);
}
