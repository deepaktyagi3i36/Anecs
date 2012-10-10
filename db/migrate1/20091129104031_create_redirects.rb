class CreateRedirects < ActiveRecord::Migration
  def self.up
    create_table :redirects do |t|
      t.column :priority, :integer, :null => false
      t.column :pattern, :string, :limit => 128, :null => false
      t.column :httpurl, :string, :limit => 128, :null => false, :default => "/"
      t.column :status, :integer, :null => false, :default => 301
      t.column :flash, :string, :limit => 1024, :null => true
      t.column :enabled, :integer, :null=>false, :default => 1
      t.timestamps
    end

    # Add indexes
    add_index :redirects, :pattern, :unique
  end

  def self.down
    drop_table :redirects
  end
end
