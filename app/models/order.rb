class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  validates :status, :inclusion => [:reserved, :cancelled, :purchased, :deleted], :presence => true
  validates :user, :presence => true
end
