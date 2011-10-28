class AddRelationsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :company_id, :integer
    add_column :users, :manager_id, :integer

    add_index :users, :company_id
    add_index :users, :manager_id
  end

  def self.down
    remove_index :users, :manager_id
    remove_index :users, :company_id

    remove_column :users, :manager_id
    remove_column :users, :company_id
  end
end
