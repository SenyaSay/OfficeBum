require 'spec_helper'

describe Order do
  let(:product1){ create :product, price: 10 }
  let(:product2){ create :product, name: 'product2', price: 5 }
  let(:user){ create :user }
  let(:order){ build :order }

  describe "#total_price" do
    it do
      order.order_products.build(product: product1, quantity: 3, price: product1.price)
      order.order_products.build(product: product2, quantity: 2, price: product2.price)
      order.save
      order.total_price.should == 40
    end
  end

  describe "#build_order_products" do
    it do
      order.build_order_products(product1 => 5, product2 => 6)
      order.should have(2).order_products
    end
  end

  describe ".update_status" do
    before(:each) do
      order.order_products.build(product: product1)
      order.status = :reserved
      order.save
    end
    it { order.update_status(:in_process).should be_true }
    it { order.update_status(:delivered).should_not be_true }
    it { order.update_status(:fake).should_not be_true }
  end
  describe ".state_machine" do
    it do
      order.order_products.build(product: product1)
      order.status = :reserved
      order.save
      order.state_transitions.map(&:to_name).should == [:in_process, :cancelled]
    end
  end
end
