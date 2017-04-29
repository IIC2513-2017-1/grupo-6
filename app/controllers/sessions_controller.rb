class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user&.password == params[:sessions][:password]
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful.'
    else
      redirect_to(new_sessions_path, alert: 'Wrong email or password.')
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful.'
  end
end