class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image, :category, :category_id, :brand, :code
  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :order_products
  has_many :orders, :through => :order_products

  validates :name, :presence => true

  PAGINATE_PER_PAGE = 9

  def self.list(category = nil, page = 1)
    (if category
       categories = Category.find(category).self_and_descendants
       Product.where(category_id: categories)
     else self
    end ).page(page).per(PAGINATE_PER_PAGE)
  end
end
