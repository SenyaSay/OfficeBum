class Cart
  attr_reader :products, :to_cookies

  def initialize(cart_cookies = {})
    @to_cookies = {}
    @products = {}
    @cart_cookies = cart_cookies
    add_items
  end

  def total_price
    @products.inject(0) { |result, (product, quantity)| result + quantity*product.price }
  end

  private

  def add_items
    @cart_cookies.each do |key, value|
      product = Product.find_by_id(key)
      if product
        @products.merge!(product => value)
        @to_cookies.merge!(key => value)
      end
    end
  end

end

