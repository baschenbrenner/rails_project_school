module ApplicationHelper
    
    
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
  
  def user_path
          if session[:user_type] == "student"
            student_path(current_user)
          else
            teacher_path(current_user)
          end
  end
    
 
    
    
    
end
