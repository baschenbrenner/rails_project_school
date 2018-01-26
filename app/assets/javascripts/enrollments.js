
function addEnrollment(courseId, studentId) {

  $.ajax({
    url: '/enrollments',
    method: 'post',
    data: { 'authenticity_token': $('input[name="authenticity_token"]')[0].value,
    'enrollment': {course_id: courseId, student_id: studentId}
    }
    ,
    dataType: "json"

  })
  .success(function(data) {
    var html = ""
    $.get("/courses/" + data.course_id + ".json", function(courseData) {

      html += "<h2> Course Title:"
      html += courseData.title
      html += "</h2><li> Catalog Number: "
      html += "<a href='javascript:showCourseDetails("
      html += courseData.id
      html += ")'>"
      html += courseData.catalog_number
      html += "</a></li><br/><br/>"

      $('#newCourses').append(html)
    })
  })
  .error(function(response) {
    console.log("There was a problem.", response);
  });
}
