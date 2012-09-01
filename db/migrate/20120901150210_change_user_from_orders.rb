class ChangeUserFromOrders < ActiveRecord::Migration
  def up
    change_column :orders, :user_id, :integer, :null => true
  end

  def down
    change_column :orders, :user_id, :integer, :null => false
  end
end
