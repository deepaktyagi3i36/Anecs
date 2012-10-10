class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column :website_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 5000, :null => false
      t.column :permalink, :string, :limit => 255, :null => true
      t.column :slug, :string, :limit => 255, :null => true
      t.column :ancestry, :string, :limit => 255, :null => true
      t.column :weight, :integer, :null => false, :default => 0
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :categories, :websites, :column => "website_id"

    # Create indexes
    add_index :categories, :code, :unique
    add_index :categories, :ancestry
  end

  def self.down
    drop_table :categories
  end
end

