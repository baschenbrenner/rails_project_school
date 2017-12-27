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
has many essential learnings
has many questions

essential learnings
belongs to course

questions
belongs to student
belongs to course
belongs to teacher, through student

comment
belongs to teacher
belongs to student
belongs to question


