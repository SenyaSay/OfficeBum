class Order < ActiveRecord::Base
  attr_accessible :user_id, :status, :description
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  validates :status, :inclusion => [:reserved, :cancelled, :purchased, :deleted], :presence => true
  validates :user, :presence => true

  STATUS = ["reserved", "cancelled", "purchased", "deleted" ]

  def total_price
    self.order_products.inject(0){ |result, product| result + product.quantity*product.price }
  end

end

