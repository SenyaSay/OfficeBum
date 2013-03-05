class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title, null: false
      t.string :caption, null: false
      t.text :description
      t.boolean :visible, default: false
      t.timestamps
    end
  end
end
