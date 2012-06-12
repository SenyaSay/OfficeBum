require 'spec_helper'

describe Product do
  let(:product) { create :product }
  let(:characteristic) { create :characteristic }

  describe "#update_characteristics" do
    let(:new_characteristics) { { 1 => "a", 2 => "b", 3 => "" } }

    def do_update
      product.update_characteristics(new_characteristics)
    end

    before :each do
      product.characteristics << characteristic
    end

    it "should create non-empty items " do
      expect { do_update }.to change { ProductCharacteristic.count }.by(1)
    end

    it "should delete existing related characteristics" do
      do_update
      product.characteristics.should_not include(characteristic)
    end
  end

  describe "#characteristic_value" do
    subject { product.characteristic_value(characteristic) }

    context "when product has characteristic" do
      let(:value) { "value" }

      before :each do
        product.characteristics << characteristic
        product.product_characteristics.first.update_attribute(:value, value)
      end

      it { should == value }
    end

    context "when product hasn't characteristic" do
      it { should be_nil }
    end
  end
end
