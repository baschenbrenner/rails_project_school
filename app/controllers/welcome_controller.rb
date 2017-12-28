class WelcomeController < ApplicationController
  def home
  end
  
  def signup
    @teacher = Teacher.new
    @student = Student.new
  end
  
end
