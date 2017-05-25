class RecoverPasswordMailer < ApplicationMailer
  def send_new_password(user, password)
    @user = user
    @password = password
    mail subject: 'Password Reset', to: user.email
  end
end
