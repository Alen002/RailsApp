class UserMailer < ApplicationMailer

  default from: 'Alenslo@gmx.net'

  def contact_form(email, name, message)
    @message = message
    mail(from: email, to: 'Alenslo@gmx.net', subject: "A new contact form message from {#name}")
  end

  def welcome_form(email)
    mail(to: email, subject: "Thank you for the registering on Alens Biker Shop")
  end

end
