class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.references :user
      t.references  :client
      t.datetime :date_of_issue
      t.datetime :paid_date
      t.integer :po_number
      t.float :discount
      t.boolean :archive
      t.boolean :delete
      t.boolean :recurring
      t.integer :occurence
      t.integer :frequency_id
      t.date  :start_date
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
