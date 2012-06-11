class Menu
  def initialize(current = nil, parent = nil)
    root = parent || current
    @base_item = Characteristic.find_by_id(root.to_i) if root
  end

  def build
    if @base_item
      @base_item.product_characteristics.map{|pc| MenuItem.new(pc.id, pc.value, @base_item.id)}
    else
      Characteristic.with_level.map { |c| MenuItem.new(c.id, c.name, nil) }
    end
  end
end
