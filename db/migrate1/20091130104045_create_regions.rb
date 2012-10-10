class CreateRegions < ActiveRecord::Migration
  def self.up
    # TODO: erase code
    return if self.table_exists?("currencies")
    create_table :regions do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :title, :string, :limit => 128, :null => false
      t.column :phone, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :regions, :websites, :column => "website_id"

    # Create constraints
    add_index :regions, :name, :unique
    add_index :regions, :code, :unique
    add_index :regions, :title, :unique
  end

  def self.down
    drop_table :regions
  end
end
