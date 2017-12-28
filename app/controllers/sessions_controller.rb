class SessionsController < ApplicationController
  def new
  end
  
  def create
    user_authenticate
    redirect_to courses_path
  end
  
  def show
  end
  
  def destroy
  end
  
  private
  
  def user_authenticate
        if params[:user_type] == "student"
            @student = Student.find_by(email: params[:email])
            return head(:forbidden) unless @student.authenticate(params[:password])
            session[:user_id] = @student.id 
        else
            @teacher = Teacher.find_by(email: params[:email])
            return head(:forbidden) unless @teacher.authenticate(params[:password])
            session[:user_id] = @teacher.id 
        end
  end
    
end
