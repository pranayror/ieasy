class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :invoice
      t.string :name
      t.text :description
      t.float :unit_cost
      t.integer :quantity
      t.integer :tax1
      t.integer :tax2
      t.boolean :track_inventory
      t.integer :current_stock
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
