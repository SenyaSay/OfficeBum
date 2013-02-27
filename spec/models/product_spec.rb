require 'spec_helper'

describe Product do
  let(:category1){ create :category }
  let(:category2){ create :category, name: 'animal' }

  let(:product1){ create :product, category: category1}
  let(:product2){ create :product, name: 'Cat', category: category2 }

  describe ".list" do
    it { Product.list.should include(product1, product2) }
    it { Product.list(category1).should include(product1) }
    it { Product.list(category1).should_not include(product2) }
    it { Product.list(category2).should include(product2) }
    it { Product.list(category2).should_not include(product1) }
  end
end
