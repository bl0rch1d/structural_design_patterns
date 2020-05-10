# Prototypes
class Order; end
# =================

class Order
  def initialize(product, transaction, shipping)
    @product = product
    @transaction = transaction
    @shipping = shipping
  end

  def created_at
    Time.now
  end

  def show_summary
    puts 'Product info:'
    puts @product.name
    puts @product.price
    puts "-------------\n"

    puts 'Transaction info:'
    puts @transaction.transaction_id
    puts @transaction.created_at
    puts "-------------\n"

    puts 'Shipping info:'
    puts @shipping.tracking_number
    puts @shipping.created_at
    puts "-------------\n"

    puts self.created_at
  end
end
