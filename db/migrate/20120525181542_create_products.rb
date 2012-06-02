class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.string :image
      t.timestamps
    end
  end
end
