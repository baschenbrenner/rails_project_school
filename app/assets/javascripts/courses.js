$(document).ready(function() {
   attachListeners();

});


function attachListeners() {
  //
  // $('td').on("click",function(){
  //   doTurn(this)
  // })

  $('button#getCourses').on("click",() => showCourses());
  $('a#courses').click( function(e) {e.preventDefault(); showCourses(); return false;}  );
}

function showCourses() {

    $.get('/courses').done(function(data) {
      let courseList = "Course List <br/>";
      data.forEach(function(element) {
         courseList += `<a href="/courses/${element.id}">${element.title}</a></br>`;})
         $('div#course-list')[0].innerHTML = courseList;

      });
}
