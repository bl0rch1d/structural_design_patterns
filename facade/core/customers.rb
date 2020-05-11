# Prototypes
class Customer; end
class Buyer < Customer; end
class Guest < Customer; end
# =================

# Interface
class Customer
  def email; end
  def shipping_address; end
  def payment_information; end
end
# =================

class Buyer < Customer
  attr_accessor :first_name, :last_name, :email, :shipping_address, :payment_information

  def initialize(email, first_name, last_name)
    @email = email
    @first_name = first_name
    @last_name = last_name
  end
end

class Guest < Customer
  attr_accessor :email, :shipping_address, :payment_information

  def initialize(email)
    @email = email
  end
end
