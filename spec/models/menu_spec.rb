require 'spec_helper'

describe Menu do

  describe "#build" do
    subject { Menu.new(top).build }

    let(:top) { nil }
    let!(:characteristic1) { create :characteristic, :name => "weight" }
    let!(:characteristic2) { create :characteristic, :name => "size" }

    context "when it is submenu " do
      context "and characteristic exists" do
        let(:top) { characteristic1.id }

        before(:each) do
          characteristic1.product_characteristics.create(:product_id => 1, :value => "val1")
          characteristic1.product_characteristics.create(:product_id => 2, :value => "val1")
          characteristic1.product_characteristics.create(:product_id => 3, :value => "val2")
        end

        it { should =~ [{ :name => "val1", :top => characteristic1.id, :value => "val1" },
                        { :name => "val2", :top => characteristic1.id, :value => "val2" }] }
      end

      context "but characteristic doesn't exist'" do
        let(:top) { 0 }
        it { should =~ [{ :name => "weight", :top => characteristic1.id }, { :name => "size", :top => characteristic2.id }] }
      end
    end

    context "when it is top level menu " do
      it { should =~ [{ :name => "weight", :top => characteristic1.id }, { :name => "size", :top => characteristic2.id }] }
    end
  end
end
