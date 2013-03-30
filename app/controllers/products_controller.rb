class ProductsController < StoreController
  before_filter :find_product, :only => :show

  def index
    category = Category.find_by_id(params[:category])
    @categories = category.self_and_ancestors if category
    @products = Product.list(category, params[:page])
  end

  def show

  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end

