class CreateStorehouses < ActiveRecord::Migration
  def self.up
    create_table :storehouses do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :region_id, :integer, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :storehouses, :websites, :column => "website_id"
    add_foreign_key :storehouses, :regions, :column => "region_id"

    # Create indexes
    add_index :storehouses, :name, :unique
    add_index :storehouses, :region_id
  end

  def self.down
    drop_table :storehouses
  end
end
