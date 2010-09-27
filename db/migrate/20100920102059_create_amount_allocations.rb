class CreateAmountAllocations < ActiveRecord::Migration
  def self.up
    create_table :amount_allocations do |t|
      t.float :amount
      t.integer :bank_id
      t.integer  :category_id
      t.integer  :sub_category_id
      t.integer :user_tax_id
      t.integer  :client_id
      t.timestamps
    end
  end

  def self.down
    drop_table :amount_allocations
  end
end
