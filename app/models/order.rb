class Order < ActiveRecord::Base
  attr_accessible :status, :description, :user, :user_id
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  validates :status, :inclusion => [:reserved, :cancelled, :purchased, :deleted], :presence => true
  validates :user, :presence => true

  STATUS = %w(reserved cancelled purchased deleted)

  def self.build_with_products(params, products)
    order = self.new(params)
    order.build_order_products(products)
    order
  end

  def total_price
    order_products.sum{ |product| product.quantity*product.price }
  end

  def build_order_products(products)
    products.each do |product, quantity|
      order_products.build(product: product,
                           quantity: quantity,
                           price: product.price)
    end
  end


end

