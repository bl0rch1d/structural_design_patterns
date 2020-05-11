class ProductsMarketplace
  def initialize
    @storage = Storage.new
  end
  
  def initialize_checkout(customer)
    @current_user = customer
  end

  def add_product(product)
    @storage.add_product(product)
  end

  def show_products
    @storage.products
  end

  def remove_product(product)
    @storage.remove_product(product)
  end

  def place_order(product_sku, quantity, shipping_address, payment_information)
    puts 'Validating shipping address...'
    ShippingAddressValidator.new(shipping_address).call
    sleep 0.5
    puts "\n"

    puts 'Validating product inventory address...'
    InventoryValidator.new(@storage, product_sku, quantity).call
    sleep 0.5
    puts "\n"

    puts 'Validating payment_information address...'
    PaymentInformationValidtor.new(payment_information).call
    sleep 0.5
    puts "\n"

    puts 'Tracking products...'
    product = InventoryTracker.new(@storage, product_sku, quantity).call
    sleep 1
    puts "\n"

    puts 'Processing transaction'
    transaction = MoneyCharger.new(@current_user, payment_information).call
    sleep 0.5
    puts '10%  :=='
    sleep 0.5
    puts '30%  :======'
    sleep 0.5
    puts '60%  :============'
    sleep 0.5
    puts "100% :===================="
    puts "\n"

    puts 'Initialize shipping...'
    shipping = ShippingInitializer.new(@current_user, payment_information, shipping_address, product).call
    sleep 0.5
    puts '30%  :======'
    sleep 0.5
    puts "100% :===================="
    puts "\n"

    puts 'Building order summary...'
    sleep 0.3
    @order = OrderBuilder.new(product, transaction, shipping).call
    puts "\n"

    puts "Sending notifications..."
    if @current_user.is_a?(Guest)
      GuestNotificator.new(@current_user, @order).call
    else
      BuyerNotificator.new(@current_user, @order).call
    end
    puts "\n"

    puts 'Order has been successfully placed!'
    print_order
  end

  def print_order
    puts '=== Order summary ==='
    @order.show_summary
  end
end
