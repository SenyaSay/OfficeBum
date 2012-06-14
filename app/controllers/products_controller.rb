class ProductsController < ApplicationController
  before_filter :build_menu

  def index
    @products = Product.products_list(params[:top], params[:value], params[:page])
  end

  private

  def build_menu
    @menu = Menu.new(params[:top]).build
  end
end
