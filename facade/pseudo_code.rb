# Store place order system
class Validator; end
class ShippingAddressValidator < Validator; end
class InventoryValidator < Validator; end
class PaymentInformationValidtor < Validator; end

class OrderProcessor; end
class InventoryTracker < OrderProcessor; end
class MoneyCharger < OrderProcessor; end
class ShippingInitializer < OrderProcessor; end

class Notificator; end
class BuyerNotificator < Notificator; end
class GuestNotificator < Notificator; end

class OrderBuilder; end

# User system
class Customer; end
class Buyer < Customer; end
class Guest < Customer; end

# Products
class Product; end
class IphoneXR < Product; end
class MacBookPro16 < Product; end

# Checkout system
class ProductsMarketplace
  def initialize(customer)
    @current_user = customer
  end

  def initialize_checkout(customer)
    @current_user = customer
  end

  def place_order(product_sku, quantity, shipping_address, payment_information)
    ShippingAddressValidator.new(shipping_address).call
    InventoryValidator.new(@storage, product_sku, quantity).call
    PaymentInformationValidtor.new(payment_information).call

    product = InventoryTracker.new(@storage, product_sku, quantity).call

    transaction = MoneyCharger.new(@current_user, payment_information).call

    shipping = ShippingInitializer.new(@current_user, payment_information, shipping_address, product).call

    order = OrderBuilder.new(product, transaction, shipping).call

    if @current_user.is_a?(Guest)
      GuestNotificator.new(@current_user, order).call
    else
      BuyerNotificator.new(@current_user, order).call
    end

    puts 'Order placed!'
  end
end

shipping_address = {...}
payment_inforation = {...}

iphone_xr = IphoneXR.new
macbook_pro_16 = IphoneXR.new

customer = Buyer.new

pm = ProductsMarketplace.new
pm = pm.initialize_checkout(customer)
pm.place_order(iphone_xr.sku, 1, shipping_address, payment_information)
