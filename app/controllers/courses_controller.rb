class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @question = Question.new
    @questions = @course.questions
  end

  def index
    @courses = Course.all
  end
end
