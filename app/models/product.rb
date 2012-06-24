class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image
  mount_uploader :image, ImageUploader

  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics

  validates :name, :presence => true

  PAGINATE_PER_PAGE = 9

  scope :with_characteristic, (lambda do |characteristic, value|
    options = { :characteristic_id => characteristic }
    options.merge({ :value => value }) if value
    joins(:product_characteristics).where(:product_characteristics => options )
  end)

  def self.list(characteristic = nil, value = nil, page = 1)
    (if characteristic
        with_characteristic(characteristic, value)
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
