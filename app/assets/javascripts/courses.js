$(document).ready(function() {
   attachListeners();
});

function Course(attributes){
  this.id = attributes.id;
  this.description = attributes.description;
  this.title = attributes.title;
  this.teacher_id = attributes.teacher_id;
  this.catalog_number = attributes.catalog_number;
  this.room_number = attributes.room_numbers;
  this.day_time_meeting = attributes.day_time_meeting;
}

function attachListeners() {
  //
  // $('td').on("click",function(){
  //   doTurn(this)
  // })
  $('button#getCourses').on("click",() => showAllCourses());
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

function showAllCourses() {
    var html = ""
    $.ajax({
      url: '/courses',
      method: 'get',
      dataType: "json"
    })
    .success(function(data) {
      var source   = $("#course-template").html();
      var template = Handlebars.compile(source);
      data.forEach(function(element) { html += template(element)})
      $("div#course-list").append(html);
      })
      .error(function(response) {
        console.log("There was a problem.", response);
      });
}
