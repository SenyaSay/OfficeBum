class ProductCharacteristic < ActiveRecord::Base
  attr_accessible :characteristic_id, :value
  belongs_to :product
  belongs_to :characteristic
end
