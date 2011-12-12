module ApplicationHelper

  def breadcrumbs(category)
    if category
      categories = category.ancestors.map(&:name)
      categories.map do |c|
        concat(link_to(c, catalog_url(:category => c)) + ' > ')
      end
      category.name
    end
  end
end
