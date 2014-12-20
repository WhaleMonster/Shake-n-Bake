$(document).ready(function() {
  var idNum = 1


  $('#addQuestion').click(function(e){
    idNum += 1;

    var listOfQuestions = $("#listOfQuestions");

    listOfQuestions.append("<input name=" + "question" + idNum + " type='text' placeholder='What is your question...'>" + "<br>")

  });

// when they hit delet button
// runs a function that will delete from view
// then call ajax and delete from teh database

// Delete each question from the survey

  $("#survey_form a.deleteQuestion").click(function(e) {
    e.preventDefault();
    e.stopPropagation();



    var $target = $(e.target);
    var $li = $target.closest('li');
    var questionId = $li.data('questionId');
    var $form = $target.closest('form');

    // console.log($(this).attr('href'));

    $.ajax({
      type: 'delete',
      url: $(this).attr('href'),
      data: {questionId: questionId}
    }).done (function(response){
      $li.remove();
    });
  });

  // Delete each survey from the lsit

  $("#listSurveys input.deleteSurvey").click(function(e) {
    e.preventDefault();
    e.stopPropagation();

    var $target = $(e.target);
    var $currentSurvey = $target.closest('ul');
    var $form = $target.closest('form');
    var surveyId = $form.data('surveyId');


    $.ajax({
      type: 'delete',
      url: $form.attr("action"),
      data: {surveyId: surveyId}
    }).done (function(response){
      $currentSurvey.remove();
    });
  });

  $('.sign_out').on('click', function(e){
    e.preventDefault();
    $('#sound').get(0).play();
    setTimeout(function(){
      window.location.href = '/';
    }, 4000);
    console.log('1')
  })


});









