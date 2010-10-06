class CreateUserPermissions < ActiveRecord::Migration
  def self.up
    create_table :user_permissions do |t|
      t.integer :user_id
      t.boolean :clients, :limit=>2, :default=>1
      t.boolean :invocies, :limit=>2, :default=>1
      t.boolean :bank, :limit=>2, :default=>1
      t.boolean :credit_card, :limit=>2, :default=>1
      t.boolean :cash_expenses, :limit=>2, :default=>1
      t.boolean :wages, :limit=>2, :default=>1
      t.boolean :documents, :limit=>2, :default=>1
      t.boolean :reports, :limit=>2, :default=>1
      t.timestamps
    end
  end

  def self.down
    drop_table :user_permissions
  end
end
