var randomVar = "hello"

function Course(attributes){
  this.id = attributes.id;
  this.description = attributes.description;
  this.title = attributes.title;
  this.teacher_id = attributes.teacher_id;
  this.catalog_number = attributes.catalog_number;
  this.room_number = attributes.room_number;
  this.day_time_meeting = attributes.day_time_meeting;
}

Course.prototype.renderHTML = function(){
var html = "<h2>Course Title: "
html += this.title
html += "</h2> <ul><li> Catalog Number: "
html += this.catalog_number
html += "</li><li> Room Number: "
html += this.room_number
html += "</li></ul>"
return html
}

$(document).on("turbolinks:load", function(e) {
  $('button#showAllCourses').on("click", function(e) {e.preventDefault(); showAllCourses();});
})
$(document).on("turbolinks:load", function(e) {
  $('#new_course').on("submit", function(e){
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
     newCourse(action,params);})

})

function showStudents(teacherId, courseId) {


      enrollment_url = "/teachers/" + teacherId + "/courses/" + courseId + "/enrollments"

      $.ajax({
        url: enrollment_url,
        method: 'get',
        dataType: "json"
      })
      .success(function(data) {
        $('#studentList')[0].innerHTML = ""
        let html = "<ul>"
        data.forEach(function(element){
          html += `<li>${element.first_name} ${element.last_name} - ${element.email}</li>`
        })
        html += "</ul>"

        $('#studentList').append(html)
      })
        .error(function(response) {
          console.log("There was a problem.", response);
        });
}

function showAllCourses() {
    $("div#course-list")[0].innerHTML =""
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

function showCourseDetails(courseId) {
  var html = ""

  $.get("/courses/" + courseId +".json", function(data) {
      var source   = $("#student-course-template").html();
      var template = Handlebars.compile(source);
      html += template(data);
      $(`div#courseDetails-${courseId}`).append(html);
      });

}



function newCourse(action, params) {


    $.ajax({
      url:action,
      data:params,
      dataType: "json",
      method: "post"
    })
    .success(function(json){
     var newCourse = new Course(json);
     var courseHTML = newCourse.renderHTML();
     $('div#newlyCreatedCourse').append(courseHTML)})

  }




// fetch("/courses" + courseId + ".json")
