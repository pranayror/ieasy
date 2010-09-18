# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100917035938) do

  create_table "banks", :force => true do |t|
    t.integer  "user_id"
    t.date     "transaction_date"
    t.float    "credit"
    t.float    "debit"
    t.text     "description"
    t.text     "vendor_client"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "company_name"
    t.integer  "profession_id"
    t.string   "address"
    t.string   "address1"
    t.string   "city"
    t.string   "province_state"
    t.string   "zip_code"
    t.string   "email"
    t.string   "business_phone"
    t.string   "mobile"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "package_id",                                           :null => false
    t.string   "company_name",        :limit => 100, :default => "",   :null => false
    t.string   "package_email",       :limit => 100, :default => "",   :null => false
    t.string   "login",               :limit => 10,  :default => "",   :null => false
    t.string   "login_page_url",                     :default => "",   :null => false
    t.string   "crypted_password",                   :default => "",   :null => false
    t.string   "password_salt",                      :default => "",   :null => false
    t.string   "persistence_token",                  :default => "",   :null => false
    t.string   "single_access_token",                :default => "",   :null => false
    t.string   "perishable_token",                   :default => "",   :null => false
    t.boolean  "is_active",                          :default => true
    t.integer  "login_count",                        :default => 0,    :null => false
    t.integer  "failed_login_count",                 :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
