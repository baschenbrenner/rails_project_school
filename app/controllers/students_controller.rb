class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end

  def index
    @students = Student.all
  end
  
  
   def create
    @student = Student.create(student_params)
    session[:user_type]="student"
    session[:user_id]= @student.id
    flash[:notice]= "Sign Up Successful"
    redirect_to student_path(@student)
   end
  
  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    flash[:notice] = "Student details updated"
    redirect_to student_path(@student)
  end
  
  
  private
  
  def student_params
    params.require(:student).permit(:email, :password, :password_confirmation, :first_name, :last_name, :preferred_name, :image, :uid)
  end
  
end
