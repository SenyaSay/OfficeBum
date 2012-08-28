class Order < ActiveRecord::Base
  attr_accessible :user_id, :status, :description
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  validates :status, :inclusion => [:reserved, :cancelled, :purchased, :deleted], :presence => true
  validates :user, :presence => true

  STATUS = %w(reserved cancelled purchased deleted)

  def total_price
    order_products.sum{ |product| product.quantity*product.price }
  end

end

