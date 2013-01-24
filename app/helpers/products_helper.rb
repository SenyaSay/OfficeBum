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

  def image_block(product)
    content_tag :div do
      image_tag(product.image? ? product.image_url(:thumb) : 'rails.png', class: "photo") +
      content_tag(:div, product.name, class: :product_name)
    end
  end
end
