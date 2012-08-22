class AddDescriptionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :description, :text
  end
end
