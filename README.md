# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# rails_project_school
Navigation links:
Sign Up if not signed in
Sign In if not signed in
Sign out if signed in
All Classes for everyone



Non-user can
    - see all classes with links to individual class pages being taught
    - see individual class pages with essential learnings and teachers who are teaching that course
    - see a list of teachers with links to teacher pages
    - see individual teacher pages with bio
    - access a sign-up page to become a student
    
Students can log in and do the following:
 - see their schedule
 - see all classes being taught (with their classes highlighted)
 - see everything a non-user can
 - go to individual classes they are enrolled in and see time, meeting place, teacher and essential learnings
 - post questions to an individual course
 - post comment to a question
 - edit their comments to a question
 - delete their comments to a question
 
Teachers can log in and do the following:
 - see their schedule
 - see all classes being taught (with their classes highlighted)
 - see everything a non-user can
 - go to individual classes and see a list of students
 - see all quesitons for a course
 - post comments related to a question
 - edit their comments to a question
 - delete their comments to a question
 - delete student comments to a question
 - delete student questions


classes
Student
Teacher
EssentialLearning
Question
Comment
Course



Student
has many teachers
has many courses
has many teachers through courses
has many questions
has many comments

Teacher
has many students
has many courses
has many students through courses
has many comments

Course
belongs to teacher
has many students
has many students, through enrollments
has many essential learnings
has many questions
has many comments through questions


Enrollments
belongs to student
belongs to course


essential learnings
belongs to course

questions
belongs to student
belongs to course
has many comments

comment
belongs to teacher
belongs to student
belongs to question




for header class
        <%= link_to "View All Classes, classes_path %> | 
        <% if !user_signed_in? %> <%= link_to "sign in", new_user_session_path %> | <% end %> 
        <% if user_signed_in? %> <%= "Signed in as #{current_user.email}" %> | <% end %> <br/>
        <% if user_signed_in? %> <%= link_to "Sign out", destroy_user_session_path, method: "delete" %> <% end %>
        <% if !user_signed_in? %> <%= link_to "Sign up", new_user_registration_path %> <% end %>
       

Once meeting_schedule_string is written - for class index and show page
<%= "The class meets on #{@course.meeting_schedule_string}" %>