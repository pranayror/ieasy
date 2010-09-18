class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :organisation
      t.boolean :send_invoices
      t.string :business_phone  
      t.string :fax
      t.string :country 
      t.string :address_street1
      t.string :address_street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :secondary_country
      t.string :sec_address_street1
      t.string :sec_address_street2
      t.string :sec_city
      t.string :sec_state
      t.string :sec_zip_code
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
