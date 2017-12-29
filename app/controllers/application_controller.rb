class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def check_access
    if !session[:user_type] 
      flash[:alert] = "You do not have access to that page"
      redirect_to home_path
    end
  end
  
  def check_access_teacher
    if session[:user_type] != "teacher"
      flash[:alert] = "You do not have access to that page"
      redirect_to home_path
    end
  end
  
  def current_user
      if user_signed_in?
          if session[:user_type] == "student"
            Student.find(session[:user_id])
          else
            Teacher.find(session[:user_id])
          end
          
      end
      
  end
  
  def user_signed_in?
      !!session[:user_type]
  end
end
