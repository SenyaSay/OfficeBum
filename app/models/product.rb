class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image
  mount_uploader :image, ImageUploader

  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics

  validates :name, :presence => true

end
