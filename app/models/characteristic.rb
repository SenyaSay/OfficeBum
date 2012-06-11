class Characteristic < ActiveRecord::Base
  has_many :product_characteristics
  has_many :products, :through => :product_characteristics

  validates :name, :presence => true
	attr_accessible :name, :level

  scope :with_level, :conditions => "level is not null"
end
