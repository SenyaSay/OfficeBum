class CartProductsController < ApplicationController
  before_filter :build_cart_cookies

  def update
    id = params[:id]
    quantity = params[:count].to_i
    if quantity > 0 && id
      @cart_cookies.merge!(id => quantity)
    end
    update_cookie
  end

  def destroy
    @cart_cookies.delete(params[:id])
    update_cookie
  end

  private

  def update_cookie
    @cart = Cart.new(@cart_cookies)
    cookies[:cart] = {:value => Marshal.dump(@cart.to_cookies), :expires => 1.year.from_now.utc}
  end

  def build_cart_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end
end
