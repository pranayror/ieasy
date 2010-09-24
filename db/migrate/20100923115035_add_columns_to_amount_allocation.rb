class AddColumnsToAmountAllocation < ActiveRecord::Migration
  def self.up
    add_column :amount_allocation, :category_id, :integer
    add_column :amount_allocation, :sub_category_id, :integer
    add_column :amount_allocation, :tax_id, :integer
    add_column :amount_allocation, :client_id, :integer
  end

  def self.down
    remove_column :amount_allocation, :category_id
    remove_column :amount_allocation, :sub_category_id
    remove_column :amount_allocation, :tax_id
    remove_column :amount_allocation, :client_id
  end
  
end
