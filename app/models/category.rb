class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id
  has_many :products

  validates :name, :presence => true
end
