class CreateThemes < ActiveRecord::Migration
  def self.up
    # TODO: erase code
    return if self.table_exists?("themes")
    create_table :themes do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :primary, :integer, :null=>false, :default => 0
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :themes, :websites, :column => "website_id"

    # Create indexes
    add_index :themes, :website_id
    add_index :themes, :name, :unique
    add_index :themes, :code, :unique
  end

  def self.down
    drop_table :themes
  end
end
