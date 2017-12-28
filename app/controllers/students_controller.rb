class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def index
    @students = Student.all
  end
end
