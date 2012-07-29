class OrderProduct < ActiveRecord::Base
  attr_accessible :quantity, :price
  belongs_to :order
  belongs_to :product
end
