class CreateBanks < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|
      t.integer :user_id
      t.date :transaction_date
      t.float :credit
      t.float :debit
      t.text :description
      t.text :vendor_client
      t.timestamps
    end
  end

  def self.down
    drop_table :banks
  end
end
