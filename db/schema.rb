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

ActiveRecord::Schema.define(:version => 20101002061807) do

  create_table "amount_allocations", :force => true do |t|
    t.float    "amount"
    t.integer  "bank_id"
    t.integer  "category_id"
    t.integer  "sub_category_id"
    t.integer  "user_tax_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", :force => true do |t|
    t.integer  "user_id"
    t.date     "transaction_date"
    t.float    "credit"
    t.float    "debit"
    t.text     "description"
    t.text     "vendor_client"
    t.float    "unallocated_mny"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_contacts", :force => true do |t|
    t.integer  "client_id"
    t.string   "email",           :limit => 100
    t.string   "home_phone"
    t.string   "mobile"
    t.string   "first_name",      :limit => 40
    t.string   "last_name",       :limit => 40
    t.string   "user_name",       :limit => 40
    t.string   "password",        :limit => 40
    t.boolean  "send_login_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "organisation"
    t.boolean  "send_invoices"
    t.string   "business_phone"
    t.string   "fax"
    t.string   "country"
    t.string   "address_street1"
    t.string   "address_street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "secondary_country"
    t.string   "sec_address_street1"
    t.string   "sec_address_street2"
    t.string   "sec_city"
    t.string   "sec_state"
    t.string   "sec_zip_code"
    t.string   "notes"
    t.boolean  "archive",             :default => false
    t.boolean  "deleted",             :default => false
    t.datetime "login_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sub_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "clients",       :limit => 1, :default => 1
    t.integer  "invocies",      :limit => 1, :default => 1
    t.integer  "bank",          :limit => 1, :default => 1
    t.integer  "credit_card",   :limit => 1, :default => 1
    t.integer  "cash_expenses", :limit => 1, :default => 1
    t.integer  "wages",         :limit => 1, :default => 1
    t.integer  "documents",     :limit => 1, :default => 1
    t.integer  "reports",       :limit => 1, :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "profession_id"
    t.string   "country"
    t.string   "address"
    t.string   "address1"
    t.string   "city"
    t.string   "province_state"
    t.string   "zip_code"
    t.string   "business_phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_settings", :force => true do |t|
    t.integer  "user_id"
    t.string   "area1_color"
    t.string   "area2_color"
    t.string   "area3_color"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "invoice_logo_file_name"
    t.string   "invoice_logo_content_type"
    t.integer  "invoice_logo_file_size"
    t.datetime "invoice_logo_updated_at"
    t.string   "quality_logo_file_name"
    t.string   "quality_logo_content_type"
    t.integer  "quality_logo_file_size"
    t.datetime "quality_logo_updated_at"
    t.integer  "lines_per_page"
    t.string   "date_format"
    t.integer  "direct_links",              :limit => 1, :default => 0
    t.integer  "ieasy_branding",            :limit => 1, :default => 0
    t.string   "logo_text"
    t.integer  "colum_headings"
    t.text     "client_welcome_message"
    t.integer  "client_document_access"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_taxes", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.float    "percent"
    t.string   "government_tax_id"
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
