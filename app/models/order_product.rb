class OrderProduct < ActiveRecord::Base
  attr_accessible :order, :product, :quantity, :price
  belongs_to :order
  belongs_to :product
end
