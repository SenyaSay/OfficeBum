class CreateProductCharacteristics < ActiveRecord::Migration
  def change
    create_table :product_characteristics do |t|
      t.belongs_to :product, :null => false
      t.belongs_to :characteristic, :null => false
      t.string :value
      t.timestamps
    end

    add_index :product_characteristics, :product_id
    add_index :product_characteristics, :characteristic_id
  end
end
