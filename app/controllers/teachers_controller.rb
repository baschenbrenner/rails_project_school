class TeachersController < ApplicationController
  
  def show
    check_access
    @teacher = Teacher.find(params[:id])
  end

  def index
    check_access
    @teachers = Teacher.all
    
  end
  
  def create
    @teacher = Teacher.create(teacher_params)
    session[:user_type]="teacher"
    session[:user_id]= @teacher.id
    flash[:notice]= "Sign Up Successful"
    redirect_to teacher_path(@teacher)
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
  
  
  private
  
  def teacher_params
    params.require(:teacher).permit(:email, :password, :password_confirmation, :first_name, :last_name, :preferred_name, :bio, :quote, :image, :uid)
  end
  
  
end
