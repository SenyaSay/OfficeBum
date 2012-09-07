class Menu
  def initialize(parent = nil)
    @category = Category.find(parent) if parent
  end

  def build
    return Category.roots unless @category
    @category.leaf? ? @category.self_and_siblings : @category.children
  end
end
