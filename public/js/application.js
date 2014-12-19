$(document).ready(function() {
  var idNum = 1


  $('#addQuestion').click(function(e){
    idNum += 1;

    var listOfQuestions = $("#listOfQuestions");

    listOfQuestions.append("<input name=" + "question" + idNum + " type='text' placeholder='What is your question...'>" + "<br>")

  });


  // $("#submit").click(function(){
  //     console.log($("#1").html())

  //     $.ajax ()

  // });



//   $("#surveyId delete").click(function(e) {

//     e.preventDefault();

//     var surveyId = $( this ).surveyId;
//     var userId = $( this ).userId

//   $.ajax({
//     type: 'delete',
//     url: "/" + userId + "/surveys/" + surveyId,
//     datatype: "json",
//   }).done( function(data){

//     data.surveyId.remove();

//   });

// });


//   $("#surveyId edit").click(function(e) {

//     e.preventDefault();

//     var surveyId = $( this ).surveyId;
//     var userId = $( this ).userId

//   $.ajax({
//     type: 'put',
//     url: "/" + userId + "/surveys/" + surveyId + "/edit"
//     datatype: "json",
//   })

// });

  // $("#surveyId create").click(function(e) {

  //   e.preventDefault();

  //   var surveyId = $( this ).surveyId;
  //   var userId = $( this ).userId
  //   var submitBtn = $(this).submitBtn

  // $.ajax({
  //   type: 'get',
  //   url: "/" + userId + "surveys/new",
  //   datatype: "json",

  // }).done(function (){
  //   // append data here

  // })

});









