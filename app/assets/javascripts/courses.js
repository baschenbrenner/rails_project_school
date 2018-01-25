$(function() {
   $('a#course').on("click", function(e) {e.preventDefault(); alert("You clicked the link!");})

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





function showCourse() {

    $.get('/enrollments').done(function(data) {
      debugger;
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
