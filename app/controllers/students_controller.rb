class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
    @comments = @student.comments
  end

  def index
    @students = Student.all
  end
  
  
   def create
    if session[:user_type] == "teacher"
      @student = Student.create(student_params)
      
      if @student.id
      flash[:notice]= "Student Successfully Created"
      redirect_to teacher_path(Teacher.find(session[:user_id]))
      
      else
        @student.errors.full_messages.each do |m|
        flash[:alert] = m
        end
        render 'teachers/new_student'
      end
    else
      @student = Student.create(student_params)
      if @student.id
        session[:user_type]="student"
        session[:user_id]= @student.id
        flash[:notice]= "Sign Up Successful"
        redirect_to student_path(@student)
      else
         @student.errors.full_messages.each do |m|
        flash[:alert] = m
        end
        render 'welcome/new_student'
      end
    end
   end
  
  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    flash[:notice] = "Student details updated"
    redirect_to student_path(@student)
  end
  
  
  private
  
  def student_params
    params.require(:student).permit(:email, :password, :password_confirmation, :first_name, :last_name, :preferred_name, :image, :uid, course_ids: [])
  end
  
end
