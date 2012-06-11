class ProductsController < ApplicationController

  before_filter :build_menu

  def index

  end

  private

  def build_menu
    @menu = Menu.new(params[:current], params[:parent]).build
  end
end
