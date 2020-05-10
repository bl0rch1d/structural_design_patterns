# Prototypes
class Shipping; end
# =================

class Shipping
  attr_accessor :tracking_number

  def initialize(current_user, payment_information, shipping_address, product)
    @current_user = current_user
    @payment_information = payment_information
    @shipping_address = shipping_address
    @product = product
    @tracking_number = 'tkn_23241183847'
  end

  def created_at
    Time.now
  end
end
