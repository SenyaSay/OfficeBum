class Order < ActiveRecord::Base
  attr_accessible :status, :description, :user, :user_id
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products

  STATUS = [:reserved, :cancelled, :in_process, :accepted, :delivered, :paid, :completed]

  validates :status, inclusion: STATUS, presence: true
  validate :presence_user_or_description
  validate :presence_products

  state_machine attribute: :status, initial: :reserved do
    transition [:reserved, :accepted] => :in_process, on: :to_in_process
    transition in_process: :accepted, on: :to_accepted
    transition accepted: :delivered, on: :to_delivered
    transition accepted: :paid, on: :to_paid
    transition [:delivered, :paid] => :completed, on: :to_completed
    transition [:reserved, :in_process, :accepted] => :cancelled, on: :to_cancelled
  end

  def self.build_with_products(params, products)
    order = self.new(params)
    order.build_order_products(products)
    order
  end

  def total_price
    order_products.sum { |product| product.quantity*product.price }
  end

  def build_order_products(products)
    products.each do |product, quantity|
      order_products.build(product: product,
                           quantity: quantity,
                           price: product.price)
    end
  end

  def update_status(new_status)
    event = "to_#{new_status}"
    if self.respond_to?(event)
      self.send(event) && self.save
    end
  end

  private

  def presence_user_or_description
    errors.add(:base, "Please login or leave your details in the description") unless (user || description.present?)
  end

  def presence_products
    errors.add(:base, "Order should have at least one product") if order_products.empty?
  end
end
