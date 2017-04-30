class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:user_id] && User.find(session[:user_id])
  end

  def logged_user?
    if !current_user
      flash[:alert] = "You must be logged in to do this action"
      redirect_to root_path
      return false 
    end
    return true
  end
end
