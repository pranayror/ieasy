class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id
      t.integer :profession_id
      t.string :country
      t.string :address
      t.string :address1
      t.string :city
      t.string :province_state
      t.string :zip_code
      t.string :business_phone
      t.string :mobile
      t.string :fax
      t.string :time_zone
      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
