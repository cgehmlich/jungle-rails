class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
 
  def order_receipt(user, order)
    @email = user.email
    @order = order
    @name = user.name
    mail(to: @email, subject: "Order #{@order.id} receipt from Jungle")
  end
end
