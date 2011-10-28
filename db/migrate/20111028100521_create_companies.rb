class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :company_name
      t.string :company_short_name
      t.string :company_firm_name
      t.string :head_name
      t.string :head_position
      t.integer :cert_number
      t.integer :reg_number
      t.date :reg_date
      t.text :reg_place
      t.text :jur_address
      t.text :address
      t.text :post_address
      t.string :phone, :limit => 20
      t.string :fax, :limit => 20
      t.integer :inn
      t.string :taxation_form
      t.integer :cert_taxpayer_number
      t.string :activity_kind
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
