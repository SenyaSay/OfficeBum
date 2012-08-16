class Cart
  attr_reader :items

  def initialize(cart_cookies = {})
    @items = {}
    cart_cookies.each do |key, value|
      product = Product.find(key)
      @items.merge!(product.name => [value, product.price])
    end
  end

  def total_price
    @items.inject(0) { |result, (_, value)| result + value[0]*value[1] }
  end

end

