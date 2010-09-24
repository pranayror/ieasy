class CreateUserTaxes < ActiveRecord::Migration
  def self.up
    create_table :user_taxes do |t|
      t.integer   :user_id
      t.string   :name
      t.float    :percent
      t.string   :government_tax_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_taxes
  end
end
