class ProductCharacteristic < ActiveRecord::Base
  belongs_to :product
  belongs_to :characteristic
end
