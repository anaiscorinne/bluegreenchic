// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
 $(document).ready(function(){
  $('.modal-trigger-key').leanModal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .2, // Opacity of modal background
      in_duration: 500, // Transition in duration
      out_duration: 400, // Transition out duration
    }
  );
  });

 // $('.modal-trigger-key').onClick(
 // 		('#modal-key').openModal();
 // 	)