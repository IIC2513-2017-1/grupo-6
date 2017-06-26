class OrderMailer < ApplicationMailer
  def send_new_order(user, order)
    @user = user
    @order = order
    mail subject: "Your Order with ID #{order.id} has just been placed!", to: user.email
  end
end
