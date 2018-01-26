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
  fetch(`/courses/${courseId}`)
    .then(function(response) {
      return response.json();
    })
    .then(function(data){
      let el=document.getElementById("container");
      el.innerHTML = `<li>Description:</li>`;
    })
}
