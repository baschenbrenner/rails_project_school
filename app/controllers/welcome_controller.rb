class WelcomeController < ApplicationController
  def home
  end
  
  def signup
    @teacher = Teacher.new
    @student = Student.new
  end
  
  def new_student
    @student = Student.new
    render 'new_student'
  end
  
  def new_teacher
    @teacher = Teacher.new
    render 'new_teacher'
  end
  
end
