class StaticPagesController < ApplicationController
  layout 'store'
  before_filter :pages
  before_filter :build_cart_cookies
  before_filter :build_cart
  before_filter :build_menu

  def show
    @page = StaticPage.find(params[:id])
  end

  private

  def pages
    @pages = StaticPage.visible
  end

  def build_menu
    @menu = Menu.new(params[:category]).build
  end

  def build_cart
    @cart = Cart.new(@cart_cookies)
  end

  def build_cart_cookies
    @cart_cookies = cookies[:cart] ? Marshal.load(cookies[:cart]) : {}
  end
end
