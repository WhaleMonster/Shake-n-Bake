$(document).ready(function() {

$('.sign_out').on('click', function(e){
  e.preventDefault();
  $('#sound').get(0).play();
  setTimeout(function () {
       $('#sign-out').submit(); //will redirect to your blog page (an ex: blog.html)
    }, 4000);
});

});









