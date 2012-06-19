require 'spec_helper'

describe Product do
  let(:product) { create :product }
  let(:characteristic) { create :characteristic }

  describe "#list" do
   
    let!(:product_characteristic1) {create :product_characterisitcs, :product_id => 1, :top => 1 , :value => 1}
    let!(:product_characteristic2) {create :product_characterisitcs, :product_id => 1, :top => 2 , :value => 2}
    let!(:product_characteristic3) {create :product_characterisitcs, :product_id => 2, :top => 1 , :value => 1}
    let!(:product_characteristic4) {create :product_characterisitcs, :product_id => 3}

    it "when product has value and characteristic" do
      Product.list(1,1,1).count.should eq(2)
    end

    it "when product has characteristic and hasn't value" do
      Product.list(1,nil,1).count.should eq(2)
    end

    it "when product hasn't caharacteristic and hasn't value, or hasn't only characteristic" do
      Product.list(nil,nil,1).count.should eq(3)   
    end

  end
    
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
