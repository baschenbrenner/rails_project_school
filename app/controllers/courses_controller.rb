class CoursesController < ApplicationController
  def show
    check_access
    @course = Course.find(params[:id])
    @question = Question.new
    @questions = @course.questions
    @comment = Comment.new
    
  end
  
  def new
    check_access_teacher
    @course = Course.new
  end

  def create
    check_access_teacher
    @course = Course.create(course_params)
    redirect_to teacher_path(current_user)
  end
  
  def index
    @courses = Course.all
  end
  
  private 
  
  def course_params
    params.require(:course).permit(:title, :description, :catalog_number, :room_number, :teacher_id)
  end
  
end
