class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image, :category, :category_id
  mount_uploader :image, ImageUploader

  belongs_to :category
  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics
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

  def update_characteristics(new_characteristics)
    characteristics.clear
    new_characteristics.each do |key, value|
      if value.present?
        self.product_characteristics.build(:characteristic_id => key, :value => value).save
      end
    end
  end

  def characteristic_value(characteristic)
    product_characteristic = product_characteristics.detect{|pc| pc.characteristic_id == characteristic.id }
    product_characteristic.value if product_characteristic
  end

end
