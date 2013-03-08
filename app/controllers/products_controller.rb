class ProductsController < ApplicationController
  layout 'store'

  before_filter :build_menu
  before_filter :find_product, :only => :show
  before_filter :build_cart_cookies
  before_filter :build_cart
  before_filter :pages

  def index
    category = Category.find_by_id(params[:category])
    @categories = category.self_and_ancestors if category
    @products = Product.list(category, params[:page])
  end

  def show

  end

  private

  def pages
    @pages = StaticPage.visible
  end

  def build_menu
    @menu = Menu.new(params[:category]).build
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def build_cart
    @cart = Cart.new(@cart_cookies)
  end

  def build_cart_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end
end
