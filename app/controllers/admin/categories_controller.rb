class Admin::CategoriesController < Admin::BaseController
  before_filter :find_categories, :only => :index
  before_filter :find_category, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]
    if @category.save
      redirect_to admin_categories_path
    else
      set_flash_error
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = 'Category was successfully updated.'
      redirect_to admin_category_path(@category)
    else
      set_flash_error
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def find_categories
    @categories = Category.roots
  end

  def set_flash_error
    flash[:error] = @category.errors.full_messages
  end

end
