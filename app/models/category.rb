class Category < ActiveRecord::Base
  has_ancestry
  has_many :products

  validates_presence_of :name
end
