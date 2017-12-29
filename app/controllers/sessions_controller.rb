class SessionsController < ApplicationController
  def new
  end
  
  def create
    user_authenticate
    if session[:user_type] == "student"
      redirect_to student_path(Student.find(session[:user_id]))
    elsif session[:user_type] == "teacher"
      redirect_to teacher_path(Teacher.find(session[:user_id]))
    else
      redirect_to login_path
    end
    
  end
  
   
  
  def show
  end
  
  def destroy
      session.clear
      redirect_to home_path
  end
  
  private
  
  def user_authenticate
        if params[:user_type] == "student"
            @student = Student.find_by(email: params[:email])
            if @student
              if @student.authenticate(params[:password])
                session[:user_type] = "student"
                session[:user_id] = @student.id 
              else
                flash[:alert] = "Incorrect password"
              end
            else
              flash[:alert] = "That email could not be found"
            end
            
        elsif params[:user_type] == "teacher"
           
            if @teacher = Teacher.find_by(email: params[:email])
              if @teacher.authenticate(params[:password])
                session[:user_type] = "teacher"
                session[:user_id] = @teacher.id
              else
                flash[:alert] = "Incorrect password"
              end
            else
              flash[:alert] = "That email could not be found"
            end
        else
            if Student.find_by(uid: auth['uid'])
              @student = Student.find_by(uid: auth['uid'])
            else  
             @student = Student.create(email: auth['info']['email'], image: auth['info']['image'], password: "password", uid: auth['uid']) 
            end
    
            session[:user_type] = "student"
            session[:user_id] = @student.id 
        end
  end
 
    
   
 
 
  def auth
    request.env['omniauth.auth']
  end
    
end
