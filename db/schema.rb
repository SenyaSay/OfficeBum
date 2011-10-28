# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111028124348) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "company_short_name"
    t.string   "company_firm_name"
    t.string   "head_name"
    t.string   "head_position"
    t.integer  "cert_number"
    t.integer  "reg_number"
    t.date     "reg_date"
    t.text     "reg_place"
    t.text     "jur_address"
    t.text     "address"
    t.text     "post_address"
    t.string   "phone",                :limit => 20
    t.string   "fax",                  :limit => 20
    t.integer  "inn"
    t.string   "taxation_form"
    t.integer  "cert_taxpayer_number"
    t.string   "activity_kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",                 :limit => 10
  end

  create_table "products", :force => true do |t|
    t.string   "caption",                                                                :null => false
    t.text     "description"
    t.text     "tech_description"
    t.decimal  "price",               :precision => 8, :scale => 2,                      :null => false
    t.string   "articul"
    t.integer  "count",                                             :default => 0
    t.string   "status",                                            :default => "based"
    t.string   "presence",                                          :default => "None"
    t.integer  "category_id",                                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",             :limit => 15
    t.string   "last_name",              :limit => 15
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "middle_name",            :limit => 15
    t.string   "phone",                  :limit => 15
    t.integer  "company_id"
    t.integer  "manager_id"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["company_id"], :name => "index_users_on_company_id"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["manager_id"], :name => "index_users_on_manager_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
