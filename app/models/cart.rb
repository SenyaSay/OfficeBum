class Cart
  attr_reader :products, :to_cookies

  def initialize(cart_cookies = {})
    @to_cookies = {}
    @products = {}
    @cart_cookies = cart_cookies
    add_items
  end

  def total_price
    @products.inject(0) { |result, (_, value)| result + value[0]*value[1] }
  end

  private

  def add_items
    @cart_cookies.each do |key, value|
      product = Product.find_by_id(key)
      if product
        @products.merge!(product.name => [value, product.price])
        @to_cookies.merge!(key => value)
      end
    end
  end

end

