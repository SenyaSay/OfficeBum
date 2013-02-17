class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :brand, :string, limit: 64
    add_column :products, :code, :string, limit: 32
  end
end
