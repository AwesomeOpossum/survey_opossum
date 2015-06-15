$(function(){

  var newQuestion = $('#templateId').html();

 $('.add-button').on('click', function(){

   $('.js-questions-container').append(newQuestion);

  });

});
