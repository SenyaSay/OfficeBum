module ProductsHelper
  def breadcrumbs(category)
    if category
      concat(link_to("Store", root_url) + ' > ')
      categories = category.ancestors
      categories.map do |c|
        concat(link_to(c.name, products_path(:category => c)) + ' > ')
      end
      category.name
    end
  end
end
