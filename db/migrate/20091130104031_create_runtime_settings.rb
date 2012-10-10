class CreateRuntimeSettings < ActiveRecord::Migration
  def self.up
    create_table :runtime_settings do |t|
      t.column :website_id, :integer, :null => true
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :value, :string, :limit => 256, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :runtime_settings, :websites, :column => "website_id"

    # Add indexes
    add_index :runtime_settings, :name, :unique
    add_index :runtime_settings, :code, :unique
  end

  def self.down
    drop_table :runtime_settings
  end
end
