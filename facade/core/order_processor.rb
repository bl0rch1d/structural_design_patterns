# Prototypes
class OrderProcessor; end
class InventoryTracker < OrderProcessor; end
class MoneyCharger < OrderProcessor; end
class ShippingInitializer < OrderProcessor; end
# =================

# Interface
class OrderProcessor
  def call; end
end
# =================

class InventoryTracker < OrderProcessor
  def initialize(storage, product_sku, quantity)
    @storage = storage
    @product_sku = product_sku
    @quantity = quantity
  end

  def call
    get_product
    track_inventory

    get_product
  end

  private

  def get_product
    @product = @storage.products.find { |product| product.sku == @product_sku }
  end

  def track_inventory
    @product.inventory - @quantity
  end
end

class MoneyCharger < OrderProcessor
  def initialize(current_user, payment_information)
    @current_user = current_user
    @payment_information = payment_information
  end

  def call
    PaymentTransaction.new(@current_user, @payment_information)
  end
end

class ShippingInitializer < OrderProcessor
  def initialize(current_user, payment_information, shipping_address, product)
    @current_user = current_user
    @payment_information = payment_information
    @shipping_address = shipping_address
    @product = product
  end

  def call
    Shipping.new(@current_user, @payment_information, @shipping_address, @product)
  end
end
