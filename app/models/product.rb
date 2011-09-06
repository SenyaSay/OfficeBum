class Product < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :caption, :price
  validates_numericality_of :price
end
