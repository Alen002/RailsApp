if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_nzn4HbB8XkqaoUMX1cw79v2B',
    secret_key: 'sk_test_JLlFjGeiPpzSeWjTFMcmFDl3'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
