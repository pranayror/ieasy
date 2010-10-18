class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.references :invoice
      t.string :task
      t.text :entry_notes
      t.float :rate
      t.float :hours
      t.integer :tax1
      t.integer :tax2
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
