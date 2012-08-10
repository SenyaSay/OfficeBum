class Cart

  def self.build(cart_cookies)
    new_hash = {}
    cart_cookies.each do |key, value|
      product = Product.find(key)
      new_hash.merge!(product.name => [value, product.price])
    end
    new_hash
  end

end
