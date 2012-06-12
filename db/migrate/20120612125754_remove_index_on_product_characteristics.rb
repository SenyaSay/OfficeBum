class RemoveIndexOnProductCharacteristics < ActiveRecord::Migration
  def up
    remove_index :product_characteristics, :product_id
    remove_index :product_characteristics, :characteristic_id
  end

  def down
    add_index :product_characteristics, :product_id
    add_index :product_characteristics, :characteristic_id
  end
end
