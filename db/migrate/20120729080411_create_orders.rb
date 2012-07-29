class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, :null => false
      t.enum :status , :limit => [:reserved, :cancelled, :purchased, :deleted], :null => false
      t.timestamps
    end
  end
end
