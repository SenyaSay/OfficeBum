class ProductCharacteristic < ActiveRecord::Base
  attr_accessible :characteristic_id, :product_id, :value
  belongs_to :product
  belongs_to :characteristic
end
