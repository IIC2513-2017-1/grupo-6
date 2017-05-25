class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user&.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to session.delete(:return_to) || root_path, notice: 'Login successful.'
    else
      redirect_to(new_sessions_path, alert: 'Wrong email or password.')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful.'
  end

  def request_password
  end

  def send_new_password_key
    email = params.require(:sessions).permit(:email)[:email]
    user = User.find_by(email: email)
    if user
      key = (0...32).map{(('a'..'z').to_a+(0..9).to_a)[rand(36)]}.join
      PasswordReset.create(key: key, user_id: user.id)
      RecoverPasswordMailer.send_new_key(user, key).deliver_later
    end
    redirect_to(root_path, notice: "An email to confirm the password reset was sent to #{email}")
  end

  def new_password
    key = params[:key]
    @password_reset = PasswordReset.find_by(key: key)
    if !@password_reset
      redirect_to(root_path, alert: "Invalid attempt to reset password.")
    end
  end

  def reset_password
    parameters = params.require(:sessions).permit(:password, :password_confirmation, :key)
    password_reset = PasswordReset.find_by(key: parameters[:key])
    if password_reset
      if parameters[:password]==parameters[:password_confirmation]
        user = password_reset.user
        user.password = parameters[:password]
        if user.save
          password_reset.destroy
          redirect_to(root_path, notice: "Your password has been reset. You may now login with your new password.")
        else
          redirect_to(sessions_reset_password_url(key: parameters[:key]), alert: "Your password must be a minimum of 6 characters long") # Es la unica razón por la que podría fallar
        end
      else
        redirect_to(sessions_reset_password_url(key: parameters[:key]), alert: "Your password must match the password confirmation")
      end
    else
      redirect_to(root_path, alert: "Invalid attempt to restore password.")
    end
  end
end
