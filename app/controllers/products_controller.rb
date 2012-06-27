class ProductsController < ApplicationController
  before_filter :build_menu
  before_filter :find_product, :only => [:show]
  before_filter :find_characteristics, :only => [:show]

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
    @characteristics = Characteristic.all
  end
end
