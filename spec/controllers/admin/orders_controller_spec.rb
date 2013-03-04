require 'spec_helper'

describe Admin::OrdersController do
  let(:product){ create :product }
  let(:order){ build :order }

  describe ".update" do
    before(:each) do
      order.order_products.build(product: product)
      order.status = :reserved
      order.save
    end
    it { order.state_transitions.map(&:to_name).should == [:in_process, :cancelled] }
    it { order.update_status(:in_process).should be_true }
    it { order.update_status(:delivered).should_not be_true }
    it { order.update_status(:fake).should_not be_true }
  end
end
