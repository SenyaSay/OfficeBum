class CartsController < ApplicationController
  before_filter :build_cart_cookies, :only => :update

  def update
    cookies[:cart] = {:value => Marshal.dump(@cart_cookies)}
    @cart = Cart.build(@cart_cookies)
  end

  def destroy
    cookies.delete :cart
    @cart = Cart.build
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
    return unless id
    @cart_cookies[id] ? @cart_cookies.merge!(id => @cart_cookies[id].next) : @cart_cookies.merge!(id => 1)
  end

end
