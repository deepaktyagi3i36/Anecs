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
      t.column :permalink, :string, :limit => 255, :null => true
      t.column :slug, :string, :limit => 255, :null => true
      t.column :metakeywords, :string, :limit => 255, :null => false
      t.column :metadescription, :text, :limit => 65535, :null => false
      t.column :ancestry, :string, :limit => 255, :null => true
      t.column :weight, :integer, :null => false, :default => 0
      t.column :enabled, :integer, :null=>false, :default => 0

      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :manpages, :websites, :column => "website_id"

    # Create indexes
    add_index :manpages, :name, :unique
    add_index :manpages, :code, :unique
    add_index :manpages, :pagetitle, :unique
    add_index :manpages, :metakeywords, :unique
    add_index :manpages, :ancestry
  end

  def self.down
    drop_table :manpages
  end
end
