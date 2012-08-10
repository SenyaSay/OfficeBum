class ProductsController < ApplicationController
  layout 'store'

  before_filter :build_menu
  before_filter :find_product, :only => [:show]
  before_filter :find_characteristics, :only => [:show]
  before_filter :build_cart_cookies
  before_filter :build_cart

  def index
    @products = Product.list(params[:top], params[:value], params[:page])
  end

  def show

  end

  private

  def build_menu
    @menu = Menu.new(params[:top]).build
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_characteristics
    @characteristics = @product.characteristics
  end

  def build_cart
    @cart = Cart.build(@cart_cookies)
  end

  def build_cart_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end
end
