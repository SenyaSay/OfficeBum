class Menu
  def initialize(top = nil)
    @top = top
    @base_item = Characteristic.find_by_id(@top.to_i) if @top
  end

  def build
    if @base_item
      @base_item.product_characteristics.group(:value).map{|pc| { :name => pc.value, :top => @base_item.id, :value => pc.value} }
    else
      Characteristic.with_level.map { |c| {:name => c.name, :top => c.id } }
    end
  end
end
