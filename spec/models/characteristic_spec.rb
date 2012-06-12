require 'spec_helper'

describe Characteristic do
  describe ".with_level" do
    let!(:characteristic1) { create :characteristic }
    let!(:characteristic2) { create :characteristic, :level => nil }

    subject { Characteristic.with_level }

    it { should have(1).item }
    it { should include(characteristic1) }
  end
end
