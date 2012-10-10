class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column :website_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 5000, :null => false
      t.column :root_id, :integer, :null => true
      t.column :parent_id, :integer, :null => true
      t.column :proposal_id, :integer, :null => false
      t.column :level, :integer, :null => false
      t.column :totals, :integer, :null => false, :default => 0
      t.column :childs, :integer, :null => false, :default => 0
      t.column :weight, :integer, :null => false, :default => 0
      t.column :treepath, :string, :limit =>255, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :categories, :websites, :column => "website_id"
    add_foreign_key :categories, :categories, :column => "root_id"
    add_foreign_key :categories, :categories, :column => "parent_id"
    add_foreign_key :categories, :proposals, :column => "proposal_id"

    # Create indexes
    add_index :categories, :code, :unique
    add_index :categories, :root_id
    add_index :categories, :parent_id
    add_index :categories, :treepath
    add_index :categories, [:id, :parent_id], :unique
  end

  def self.down
    drop_table :categories
  end
end

