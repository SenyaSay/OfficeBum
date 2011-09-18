class Category < ActiveRecord::Base
  acts_as_nested_set
  has_many :products

  validates_presence_of :name
end
