# =========== BASE PAYMENT PROVIDER INTERFACE ============
class PaymentProvider
  def make_payment
    puts 'Makes base charge'
  end
end


# ============ Stripe ============
class Stripe
  def capture_payment_intent
    puts 'Makes Stripe charge'
  end
end

class StripeAdapter < PaymentProvider
  def initialize(stripe)
    @stripe = stripe
  end

  def make_payment
    @stripe.capture_payment_intent
  end
end


# ============ Paypal ============
class Paypal
  def paypal_charge
    puts 'Makes Paypal charge'
  end
end

class PaypalAdapter < PaymentProvider
  def initialize(paypal)
    @paypal = paypal
  end

  def make_payment
    @paypal.paypal_charge
  end
end

stripe = Stripe.new
paypal = Paypal.new

payment_provider = PaymentProvider.new.make_payment
payment_provider_stripe = StripeAdapter.new(stripe).make_payment
payment_provider_paypal = PaypalAdapter.new(paypal).make_payment
