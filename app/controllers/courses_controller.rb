class CoursesController < ApplicationController
  def show
    check_access
    @course = Course.find(params[:id])
    @question = Question.new
    @questions = @course.questions
    @comment = Comment.new
    
  end

  def index
    @courses = Course.all
  end
end
