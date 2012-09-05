class Menu
  def initialize(parent_id = nil)
    @category = Category.find(parent_id) if parent_id
  end

  def build
    return Category.roots unless @category
    @category.leaf? ? @category.self_and_siblings : @category.children
  end
end
