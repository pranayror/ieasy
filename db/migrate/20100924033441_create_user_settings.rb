class CreateUserSettings < ActiveRecord::Migration
  def self.up
    create_table :user_settings do |t|
      t.integer :user_id
      t.string :area1_color
      t.string :area2_color
      t.string :area3_color
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.string :invoice_logo_file_name
      t.string :invoice_logo_content_type
      t.integer :invoice_logo_file_size
      t.datetime :invoice_logo_updated_at
      t.string :quality_logo_file_name
      t.string :quality_logo_content_type
      t.integer :quality_logo_file_size
      t.datetime :quality_logo_updated_at
      t.integer :lines_per_page
      t.string :date_format
      t.boolean :direct_links, :limit=>2, :default=>0
      t.boolean :ieasy_branding, :limit=>2, :default=>0
      t.string :logo_text
      t.integer :colum_headings
      t.text :client_welcome_message
      t.integer :client_document_access
      t.integer :template, :default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :user_settings
  end
end
