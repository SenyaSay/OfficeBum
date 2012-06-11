class MenuItem
  attr_accessor :id, :name, :parent

  def initialize(id, name, parent)
    @id, @name, @parent = id, name, parent
  end
end
