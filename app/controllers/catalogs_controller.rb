class CatalogsController < UserBaseController
  before_filter :current_category
  before_filter :find_subcategories
  before_filter :find_products
  before_filter :find_top_categories
  before_filter :find_top_products

  def show
  end

  private

  def current_category
    @category = Category.find_by_name(params[:category])
  end

  def find_subcategories
    @subcategories = @category.present? ? @category.subcategories : Category.roots
  end

  def find_products
    @products = @category.present? ? @category.products : Product.all
  end

  def find_top_products
    @top_products = @products
  end

  def find_top_categories
    @top_subcategories = @subcategories
  end
end
