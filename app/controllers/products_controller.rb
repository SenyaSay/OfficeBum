class ProductsController < ApplicationController

  before_filter :build_menu

  def index

  end

  private

  def build_menu
    @menu = Menu.new(params[:top]).build
  end
end
