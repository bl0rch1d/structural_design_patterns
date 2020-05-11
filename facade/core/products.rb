# Prototypes
class Product; end
class IphoneXR < Product; end
class MacBookPro16 < Product; end
# =================

# Interface
class Product
  def name; end
  def price; end
  def sku; end
  def inventory; end
end
# =================

class IphoneXR < Product
  attr_reader :name, :price, :sku, :inventory

  def initialize(name, price, sku, inventory)
    @name = name
    @price = price
    @sku = sku
    @inventory = inventory
  end
end

class MacBookPro16 < Product
  attr_reader :name, :price, :sku, :inventory

  def initialize(name, price, sku, inventory)
    @name = name
    @price = price
    @sku = sku
    @inventory = inventory
  end
end
