class Admin::ProductsController < ApplicationController

  before_filter :find_products, :only => :index
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product]
    if @product.save
      redirect_to admin_products_path
    else
      set_flash_error
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = 'Product was successfully updated.'
      redirect_to admin_product_path(@product)
    else
      set_flash_error
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def find_products
    @products = Product.all
  end

  def set_flash_error
    flash[:error] = @product.errors.full_messages
  end
end
