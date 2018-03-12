class UserMailer < ApplicationMailer

  default from: 'Alenslo@gmx.net'

  def contact_form(email, name, message)
    @message = message
    mail(from: email, to: 'Alenslo@gmx.net', subject: "A new contact form message from {#name}")
  end

  def welcome_form(user)
    @user = user
    mail(to: user.email, subject: "Thank you for the registering on Alens Biker Shop")
  end

  def order_placed(product, user)
    @user = user
    mail(to: user.email, subject: "Thank you for ordering our product")
  end

end
