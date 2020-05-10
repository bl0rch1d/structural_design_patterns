class Storage
  attr_reader :products

  def initialize
    @products = []
  end

  def add_product(product)
    @products.append(product)
  end

  def remove_product(product)
    @products.delete(product)
  end
end
