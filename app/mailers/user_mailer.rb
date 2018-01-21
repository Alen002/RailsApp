class UserMailer < ApplicationMailer

  default from: 'Alenslo@gmx.net'

  def contact_form(email, name, message)
    @message = message
    mail(from: email, to: 'Alenslo@gmx.net', subject: "A new contact form message from {#name}")
  end



end
