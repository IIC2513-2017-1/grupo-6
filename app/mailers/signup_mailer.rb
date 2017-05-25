class SignupMailer < ApplicationMailer
    def signup_mail(user)
        @user = user
        mail subject: "Your Account Has Just Been Created!", to: user.email
    end
end
