class RecoverPasswordMailer < ApplicationMailer
  def send_new_key(user, key)
    @user = user
    @key = key
    mail subject: 'Password Reset Confirmation', to: user.email
  end
end
