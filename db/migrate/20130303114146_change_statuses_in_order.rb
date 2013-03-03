class ChangeStatusesInOrder < ActiveRecord::Migration
  def up
    change_column :orders, :status, :enum,  limit: [:reserved, :cancelled, :in_process, :accepted, :delivered, :paid, :completed ], null: false
  end

  def down
    change_column :orders, :status, :enum,  limit: [:reserved, :cancelled, :purchased, :deleted], null: false
  end
end
