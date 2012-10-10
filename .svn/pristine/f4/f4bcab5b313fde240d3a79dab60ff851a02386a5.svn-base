class CreateManpages < ActiveRecord::Migration
  def self.up
    create_table :manpages do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :annotation, :string, :limit => 5000, :null => true
      t.column :content, :text, :limit => 16777214, :null => true
      t.column :pagetitle, :string, :limit =>128, :null => false
      t.column :metakeywords, :string, :limit =>255, :null => false
      t.column :metadescription, :text, :limit =>65535, :null => false

      t.column :parent_id, :integer, :null => true
      t.column :level, :integer, :null => false
      t.column :totals, :integer, :null => false, :default => 0
      t.column :childs, :integer, :null => false, :default => 0
      t.column :weight, :integer, :null => false, :default => 0
      t.column :treepath, :string, :limit =>255, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0

      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :manpages, :websites, :column => "website_id"
    add_foreign_key :manpages, :manpages, :column => "parent_id"

    # Create indexes
    add_index :manpages, :name, :unique
    add_index :manpages, :code, :unique
    # Nulls availables
    # add_index :manpages, :content, :unique
    add_index :manpages, :pagetitle, :unique
    add_index :manpages, :metakeywords, :unique

    add_index :manpages, :parent_id
    add_index :manpages, :treepath, :unique
    add_index :manpages, [:id, :parent_id], :unique
  end

  def self.down
    drop_table :manpages
  end
end
