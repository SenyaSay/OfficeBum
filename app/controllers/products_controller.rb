class ProductsController < ApplicationController

  before_filter :build_menu

  def index
    @products = Product.joins(:product_characteristics).where(:product_characteristics => { :characteristic_id => params[:top], :value => params[:value] } ).group(:name).page(params[:page]).per(9)
  end

  private

  def build_menu
    @menu = Menu.new(params[:top]).build
  end
end
