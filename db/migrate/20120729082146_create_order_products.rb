class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.belongs_to :order, :null => false
      t.belongs_to :product, :null => false
      t.integer :quantity, :default => 1
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
