class Product < ActiveRecord::Base
  # attr_accessible :title, :body
  mount_uploader :image, ImageUploader

  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics

  validates :name, :presence => true

end
