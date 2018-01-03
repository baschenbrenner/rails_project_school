class TeachersController < ApplicationController
  
  def show
    check_access
    @teacher = Teacher.find(params[:id])
    @courses = @teacher.courses
  end

  def index
    check_access
    @teachers = Teacher.all
    
  end
  
  def create
    @teacher = Teacher.create(teacher_params)
    user_creation
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    flash[:notice]= "Updated Teacher Information"
    redirect_to teacher_path(@teacher)
  end
  
  
  def new_student
    check_access_teacher
    @student = Student.new
  end
  
  def report
    @teachers = Teacher.order('last_name')
  end
  
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:email, :password, :password_confirmation, :first_name, :last_name, :preferred_name, :bio, :quote, :image, :uid)
  end
  
  
end
