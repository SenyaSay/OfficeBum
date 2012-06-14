class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image
  mount_uploader :image, ImageUploader

  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics

  validates :name, :presence => true

  PAGINATE_PER_PAGE = 9

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

  def self.products_list(characteristic = nil, value = nil, page = 1)
    if value 
      joins(:product_characteristics).where(:product_characteristics => { :characteristic_id => characteristic, :value => value } ).pagination(page) 
      elsif characteristic
        joins(:product_characteristics).where(:product_characteristics => { :characteristic_id => characteristic }).pagination(page)
        else pagination(page)
    end 
  end

  private

  def self.pagination(page)
    page(page).per(PAGINATE_PER_PAGE)
  end
end
