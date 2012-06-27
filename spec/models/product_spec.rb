require 'spec_helper'

describe Product do
  let(:product) { create :product }
  let(:characteristic) { create :characteristic }

  describe "#list" do
   
    let(:product1) { create :product }
    let(:product2) { create :product }
    let(:product3) { create :product }

    let(:characteristic1) { create :characteristic }
    let(:characteristic2) { create :characteristic }

    let!(:product_characteristic1) { create :product_characteristic, :product => product1, :characteristic => characteristic1 , :value => "1" }
    let!(:product_characteristic2) { create :product_characteristic, :product => product1, :characteristic => characteristic2 , :value => "2" }
    let!(:product_characteristic3) { create :product_characteristic, :product => product2, :characteristic => characteristic1 , :value => "1" }
    let!(:product_characteristic4) { create :product_characteristic }

    context "when product has characteristic and value" do
      subject { Product.list(characteristic2.id,"2") }
      
      it { should include(product1) }
      
      it { should_not include(product2) }
    
      it { should_not include(product3) }

      it { should have(1).products }
    end

    context "when product has characteristic and hasn't value" do
      subject { Product.list(characteristic1.id) }
      
      it { should include(product1) }
      
      it { should include(product2) }
    
      it { should_not include(product3) }

      it { should have(2).products }
    end

    context "when product hasn't caharacteristic and hasn't value, or hasn't only characteristic" do
      subject { Product.list }
      
      it { should include(product1) }
      
      it { should include(product2) }
    
      it { should include(product3) }

      it { should have(3).products }
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
