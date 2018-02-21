class StaticPagesController < ApplicationController

  def landing_page     #before i called it index
    @products = Product.limit(4)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    #ActionMailer::Base.mail(from: @email,
        #to: 'Alenslo@gmx.net',
        #subject: "A new contact form message from #{@name}",
        #body: @message).deliver_now
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
