module ProductsHelper
  def breadcrumbs(categories)
    if categories
      concat(link_to("Store", root_url) + ' > ')
      (categories.map do |c|
        link_to_unless_current(c.name, products_path(:category => c))
      end).join(' > ').html_safe
    end
  end

  def menu(menu_data)
    content_tag :ul do
      menu_data.map do |category|
        content_tag(:li, link_to_unless_current(category.name, products_path(:category => category)))
      end.join.html_safe
    end
  end
end
