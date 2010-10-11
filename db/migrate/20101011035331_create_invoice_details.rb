class CreateInvoiceDetails < ActiveRecord::Migration
  def self.up
    create_table :invoice_details do |t|
      t.references :invoice
      t.references :item
      t.string :status
      t.string :terms
      t.string :notes
      t.string :description
      t.integer :task_id
      t.string :task_notes
      t.float :unit_cost
      t.integer :quantity
      t.float :rate
      t.float :hours
      t.integer :tax1
      t.integer :tax2
      t.float :total
      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_details
  end
end
