class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  Rails.application.routes.default_url_options[:port]= 3000 if Rails.env.development?

  helper_method :current_user, :logged_user?, :admin?, :check_edit_permission?

  protected

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:user_id] && User.find(session[:user_id])
  end

  def logged_user?
    if !current_user
      return false 
    end
    return true
  end

  def admin?
    if current_user&.is_admin
      return true
    end
    return false
  end
  

  def authenticated_admin?
    if not current_user&.is_admin
      flash[:alert] = "Permission denied"
      redirect_to root_path
      return false 
    end
    return true
  end

  def authenticated_login?
    if not current_user
      flash[:alert] = "You must be logged in to do this action"
      redirect_to new_sessions_path
      return false 
    end
    return true
  end

  def has_edit_permission?(entity)
    if logged_user? and (admin? or current_user&.id == entity.user_id)
      return true
    end
    flash[:alert] = "Permission denied"
    redirect_to root_path
    return false
  end

  def check_edit_permission?(entity)
    if logged_user? and (admin? or current_user&.id == entity.user_id)
      return true
    end
    return false
  end
    
  
end
