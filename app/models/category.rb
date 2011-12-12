class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :products

  validates_presence_of :name

  def subcategories
    children.present? ? children : self_and_siblings
  end
end
