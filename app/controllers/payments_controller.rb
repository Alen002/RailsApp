class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    # Create the charge on Stripe's servers to charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i,
        currency: "usd",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        flash[:notice] = 'Payment has been received'

        UserMailer.order_placed(@product, @user).deliver_now
        redirect_to product_path(@product), notice: 'Thank you for your order!'
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

  end
end
