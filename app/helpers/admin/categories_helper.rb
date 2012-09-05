module Admin::CategoriesHelper
  def categoty_options(category)
    [''] + nested_set_options(Category, category) {|i| "#{'-' * i.level} #{i.name}" }
  end
end
