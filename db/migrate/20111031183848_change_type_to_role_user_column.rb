class ChangeTypeToRoleUserColumn < ActiveRecord::Migration
  def self.up
    rename_column :users, :type, :role
  end

  def self.down
    rename_column :users, :role, :type
  end
end
