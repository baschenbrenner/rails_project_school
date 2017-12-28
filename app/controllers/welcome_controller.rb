class WelcomeController < ApplicationController
  def home
  end
  
  def signup
    @teacher = Teacher.new
    @student = Student.new
  end
  
  def students
    @student = Student.new
    render 'new_student'
  end
  
  def teachers
    @teacher = Teacher.new
    render 'new_teacher'
  end
  
end
