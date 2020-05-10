# Prototypes
class Validator; end
class ShippingAddressValidator < Validator; end
class InventoryValidator < Validator; end
class PaymentInformationValidtor < Validator; end
# =================

# Interface
class Validator
  def call; end
end
# =================

class ShippingAddressValidator < Validator
  def initialize(shipping_address)
    @shipping_address = shipping_address
  end

  def call
    zip_code_valid? && phone_valid? && address_valid? ? 'VALID' : raise(ShippingAddressError) 
  end

  def zip_code_valid?
    true
  end

  def phone_valid?
    true
  end

  def address_valid?
    true
  end
end

class InventoryValidator < Validator
  def initialize(storage, product_sku, quantity)
    @storage = storage
    @product_sku = product_sku
    @quantity = quantity
  end

  def call
    product_exists? && quantity_valid? ? 'VALID' : raise(InventoryError) 
  end

  private

  def product_exists?
    @storage.products.map(&:sku).include? @product_sku
  end

  def quantity_valid?
    @storage.products.select { |product| product.sku == @product_sku  }.first.inventory >= @quantity
  end
end

class PaymentInformationValidtor < Validator
  def initialize(payment_information)
    @payment_information = payment_information
  end

  def call
    card_valid? && amount_valid? ? 'VALID' : raise(PaymentInformationError) 
  end

  private

  def card_valid?
    true
  end

  def amount_valid?
    true
  end
end
