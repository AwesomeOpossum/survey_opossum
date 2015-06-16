$(function(){

 $('.add-button').on('click', function(){

   var lastHtml = $('.question-fields').last().clone();
   var lastInputs = lastHtml.find('input');
   var lastIndex = parseInt(lastInputs.first().attr('name').match(/[0-9]+/)[0]);

   var newHtml = lastHtml;
   var newInputs = newHtml.find('input');
   var newIndex = (lastIndex+1).toString();
   newInputs.each(function(i) {
     var oldName = this.getAttribute('name');
     this.setAttribute('name', oldName.replace(/[0-9]+/, newIndex));
     var oldId = this.getAttribute('name');
     this.setAttribute('id', oldId.replace(/[0-9]+/, newIndex));
     this.value = ('');
     //this.attr('name').replace(/[0-9]+/, newIndex);
   });

   $('.questions-container').append(newHtml);

  });

 $('')


});
