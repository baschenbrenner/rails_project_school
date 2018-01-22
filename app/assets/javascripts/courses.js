$(document).ready(function() {
   attachListeners();

});


function attachListeners() {
  //
  // $('td').on("click",function(){
  //   doTurn(this)
  // })

  $('button#getCourses').on("click",() => showCourses());

}

function showCourses() {

    $.get('/courses').done(function(data) {

      debugger;});
}
