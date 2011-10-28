class AddOrgTypeToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :type, :string, :limit => 10
  end

  def self.down
    remove_column :companies, :type
  end
end
