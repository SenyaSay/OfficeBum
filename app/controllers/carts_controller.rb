class CartsController < StoreController
  before_filter :build_cart_cookies, :only => :update

  def update
    @cart = Cart.new(@cart_cookies)
    cookies[:cart] = {:value => Marshal.dump(@cart.to_cookies), :expires => 1.year.from_now.utc}
  end

  def destroy
    cookies.delete :cart
    @cart = Cart.new
  end

  private

  def build_cart_cookies
    load_cookies
    add_product
  end

  def load_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end

  def add_product
    id = params[:id]
    quantity = params[:count].to_i
    if quantity > 0 && id
      @cart_cookies.merge!(id => quantity)
    end
  end
end

