class DropCharacteristicsTable < ActiveRecord::Migration
  def up
    drop_table :characteristics
    drop_table :product_characteristics
  end
end
