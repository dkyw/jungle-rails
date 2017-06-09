class UserMailer < ApplicationMailer

  def notify_user(order)
    @order = order
    mail(to: @order.email, subject: "Your order number is #{order.id}")
  end

end
