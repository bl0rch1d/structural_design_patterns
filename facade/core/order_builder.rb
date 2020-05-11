# Prototypes
class OrderBuilder; end
# =================

class OrderBuilder
  def initialize(product, transaction, shipping)
    @product = product
    @transaction = transaction
    @shipping = shipping
  end

  def call
    Order.new(@product, @transaction, @shipping)
  end
end
