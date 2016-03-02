// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 $(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .2, // Opacity of modal background
      in_duration: 500, // Transition in duration
      out_duration: 400, // Transition out duration
    }
  );

  $('.store-name-input').on('click', function () {
  	$('.store-name-input').attr('value', "");
	  });
	 $('.store-area-input').on('click', function () {
		$('.store-area-input').attr('value', "");
	  });

   $('.before').delegate('.liked-store', 'click', function (event) {
    event.preventDefault();
    var id = $(this).data('id')
    unlikeStore(id);
  });

  $('.before').delegate('.unliked-store', 'click', function (event) {
    event.preventDefault();
    var id = $(this).data('id')
    likeStore(id);
  });
  });



function unlikeStore(id) {
  var storeId = id;
  $.ajax ({
    url: `/stores/${storeId}/unlike`,
    type: "POST",
    success: function(response) {
      $(`.div-${response.id}`).empty();
      console.log(response)
      showUnlikeStore(response)
    },
    error: function(){
      console.log("Cry");
    }
  });
}

function showUnlikeStore(response) {
  var html = `
  <a href="/stores/${response.id}/like" data-method="post" class="unliked-store" data-id="${response.id}" data-remote="true">
    <i id="store-${response.id}" class="grey-text text-darken-1 mdi mdi-heart-outline"><span class="favorite-text"> favorite</span></i>
  </a>
  `
  $(`.div-${response.id}`).append(html);
}

function likeStore(id) {
  var storeId = id;
  $.ajax ({
    url: `/stores/${storeId}/unlike`,
    type: "POST",
    success: function(response) {
      $(`.div-${response.id}`).empty();
      console.log(response)
      showLikeStore(response);
    },
    error: function(){
      console.log("Cry");
    }
  });
}

function showLikeStore(response) {
  var html = `
  <a href="/stores/${response.id}/unlike" data-method="post" class="liked-store" data-id="${response.id}" data-remote="true">
    <i id="store-${response.id}" class="red-text mdi mdi-heart"><span class="favorite-text"> favorited</span></i>
  </a>
  `
  $(`.div-${response.id}`).append(html);
}