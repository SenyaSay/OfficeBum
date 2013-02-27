require 'spec_helper'

describe Cart do
  let(:product1){ create :product, price: 10 }
  let(:product2){ create :product, price: 5 }
  let(:cart){ Cart.new(params) }

  describe "#total_price" do
    context "when params present" do
      let(:params){ {product1.id => 2, product2.id => 3} }
      it { cart.total_price.should == 35 }
    end
    context "when params absent" do
      let(:params){ {} }
      it { cart.total_price.should == 0 }
    end
  end

  describe "#to_cookies" do
    let(:params){ {product1.id => 2, -1 => 3} }
    it do
      cart.to_cookies.should == {product1.id => 2}
    end
  end

  describe "#products" do
    let(:params){ {product1.id => 5, -1 => 3} }
    it do
      cart.products.should == {product1 => 5}
    end
  end
end
