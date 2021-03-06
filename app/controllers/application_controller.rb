class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in 
    unless current_user
      flash[:alert] = "please log in"
      redirect_to new_sessions_path
    end
  end

end
