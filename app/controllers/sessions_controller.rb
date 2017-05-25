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

  def restore_password
  end

  def send_new_password
    email = params.require(:sessions).permit(:email)[:email]
    user = User.find_by(email: email)
    if user
      password = (0...16).map{(('a'..'z').to_a+(0..9).to_a)[rand(36)]}.join
      user.password = password
      user.save
      RecoverPasswordMailer.send_new_password(user, password).deliver_later
    end
    redirect_to(root_path, notice: "A new password was sent to #{email}")
  end
end
