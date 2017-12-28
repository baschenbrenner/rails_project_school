# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@teacher1 = Teacher.create(first_name: "ben", preferred_name: "Mr. Ben", password: "password")
@teacher2 = Teacher.create(first_name: "jeff", preferred_name: "Professor Friend", password: "password")
Student.create(first_name: "kasey", last_name: "farley", password: "password")
Student.create(first_name: "emma", password: "password")
Student.create(first_name: "john", password: "password")
@course1=Course.new(title: "Quantitative Reasoning", catalog_number: "MAT123 AAM", room_number: "012", day_time_meeting: "MW 9:30AM - 11:20AM")
@course2=Course.new(title: "Anatomy and Physiology", catalog_number: "BIO105 BF2", room_number: "P32", day_time_meeting: "TR 10:30AM - 12:20PM")
@course1.teacher = @teacher1
@course2.teacher = @teacher2
@course1.save
@course2.save


Enrollment.create(student_id: 1, course_id: 2)
Enrollment.create(student_id: 2, course_id: 2)
Enrollment.create(student_id: 3, course_id: 1)
Enrollment.create(student_id: 1, course_id: 1)


EssentialLearning.create(course_id: 1, name: "Financial Literacy", content: "Students will have the tools to make calculations with interest in order to make decisions about borrowing money.")
EssentialLearning.create(course_id: 1, name: "Social Capital", content: "Students will have developed relationships in the course of the semester and will also understand the importance of connections and have tools to form new relationships in subsequent terms.")

Question.create(student_id: 1, course_id: 2, content: "I am confused about how to get the exponent in web works!")

Comment.create(teacher_id: 1, question_id: 1, content: "You just type shift-6 which is the ^ symbol!")









