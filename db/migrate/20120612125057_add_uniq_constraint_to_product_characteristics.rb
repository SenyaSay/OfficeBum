class AddUniqConstraintToProductCharacteristics < ActiveRecord::Migration
  def change
    add_index :product_characteristics, [:product_id, :characteristic_id], :unique => true, :name => "index_product_characteristics_on_foreign_keys"
  end
end
