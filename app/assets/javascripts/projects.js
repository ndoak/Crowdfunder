// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("ready page:load", function(){

  $("#donate").on('click', function(e){

    e.preventDefault();

    $.ajax({
      url:$(this).attr('href'),
      type: 'POST',
      success: function(data){
        console.log(data);
        if (data){
          $("#new_goal").html(data);

          alert("Thanks!");
        }

      }

    });
  });
});
