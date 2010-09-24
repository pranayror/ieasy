class AddColumnToBank < ActiveRecord::Migration
  def self.up
  add_column :banks, :unallocated_mny, :float
  end

  def self.down
  remove_column :banks, :unallocated_mny
  end
end
