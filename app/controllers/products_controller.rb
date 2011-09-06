class ProductsController < ApplicationController
    def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product]
    if @product.save
      redirect_to products_path
    else
      flash[:error] = @product.errors.full_messages
      render :new
    end
  end
end
