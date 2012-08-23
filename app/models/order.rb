class Order < ActiveRecord::Base
  attr_accessible :user_id, :status, :description
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  validates :status, :inclusion => [:reserved, :cancelled, :purchased, :deleted], :presence => true
  validates :user, :presence => true

  STATUS = { :reserved => "reserved", :cancelled => "cancelled", :purchased=> "purchased", :deleted => "deleted" }

  def user_email(id)
    User.find_by_id(id).email
  end
end

