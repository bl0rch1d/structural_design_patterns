require_relative 'autoload'

# ====== INIT MARKETPLACE ======
iphone_xr = IphoneXR.new('iphone_xr', 999, '123485345434', 10)
macbook_pro_16 = MacBookPro16.new('macbook_pro_16', 3000, '98456745434', 4)

pm = ProductsMarketplace.new

pm.add_product(iphone_xr)
pm.add_product(macbook_pro_16)

buyer = Buyer.new('dio_theworld@mail.com', 'Dio', 'Brando')
guest = Guest.new('speedwagon@mail.com')

pm.initialize_checkout(buyer)
pm.place_order(iphone_xr.sku, 2, SHIPPING_ADDRESS, PAYMENT_INFORMATION)
