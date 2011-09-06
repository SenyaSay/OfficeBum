class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :caption, :null => false
      t.text :description
      t.text :tech_description
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.string :articul
      t.integer :count, :default => 0
      t.string :status, :default => 'based'
      t.string :presence, :default => 'None'
      t.belongs_to :category, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
