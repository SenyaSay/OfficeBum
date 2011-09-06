class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    if @category.save
      redirect_to categories_path
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end
end
