class OrderProduct < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :price
  belongs_to :order
  belongs_to :product
end
