class CreateUserSettings < ActiveRecord::Migration
  def self.up
    create_table :user_settings do |t|
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
      t.timestamps
    end
  end

  def self.down
    drop_table :user_settings
  end
end
