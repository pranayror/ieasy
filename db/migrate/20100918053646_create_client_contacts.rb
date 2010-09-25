class CreateClientContacts < ActiveRecord::Migration
  def self.up
    create_table :client_contacts do |t|
      t.references :client
      t.string :email, :limit => 100
      t.string :home_phone 
      t.string :mobile
      t.string :first_name, :limit => 40
      t.string :last_name, :limit => 40
      t.string :user_name, :limit => 40
      t.string :password, :limit => 40
      t.boolean :send_login_info
      t.timestamps
    end
  end

  def self.down
    drop_table :client_contacts
  end
end
