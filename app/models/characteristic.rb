class Characteristic < ActiveRecord::Base
  has_many :product_characteristics
  has_many :products, :through => :product_characteristics

  validates :name, :presence => true
end
