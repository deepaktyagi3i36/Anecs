class CreateContactTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null => false, :default => 1
      t.timestamps
    end

    # Add indexes
    add_index :contact_types, :name, :unique
    add_index :contact_types, :code, :unique
  end

  def self.down
    drop_table :contact_types
  end
end
