class CreateCharacteristics < ActiveRecord::Migration
  def change
    create_table :characteristics do |t|
      t.string :name, :null => false
      t.integer :level
      t.timestamps
    end
  end
end
