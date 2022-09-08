class ApplicationController < ActionController::Base

def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

   def restrictions
      unless current_user
         flash[:alert] = "Please login, first."
         redirect_to root_path
    end
  end   

end
