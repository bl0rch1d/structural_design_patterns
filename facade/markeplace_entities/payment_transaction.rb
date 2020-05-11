# Prototypes
class PaymentTransaction; end
# =================

class PaymentTransaction
  attr_accessor :transaction_id

  def initialize(user, payment_information)
    @user = user
    @payment_information = payment_information
    @transaction_id = 'ts_2324215235326'
  end

  def created_at
    Time.now
  end
end
