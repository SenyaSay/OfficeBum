class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :image
  mount_uploader :image, ImageUploader

  has_many :product_characteristics
  has_many :characteristics, :through => :product_characteristics

  validates :name, :presence => true


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

  def self.build_items()
    self.joins(:product_characteristics).where(:characteristic_id => params[:characteristic_id], :value => params[:value]).group(:name)
  end
end
