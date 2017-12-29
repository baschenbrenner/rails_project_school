class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def check_access
    if !session[:user_type] 
      flash[:alert] = "You do not have access to that page"
      redirect_to home_path
    end
  end
  
end
