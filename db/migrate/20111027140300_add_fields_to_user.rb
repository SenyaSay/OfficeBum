class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    with_options :limit => 15 do |l|
      l.add_column :users, :middle_name, :string
      l.add_column :users, :phone, :string
      l.change_column :users, :first_name, :string
      l.change_column :users, :last_name, :string
    end
  end

  def self.down
    remove_column :users, :middle_name
    remove_column :users, :phone
    change_column :users, :first_name, :string
    change_column :users, :last_name, :string
  end
end
