class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.column :website_id, :integer, :null => false
      t.column :datatype_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :properties, :websites, :column => "website_id"
    add_foreign_key :properties, :datatypes, :column => "datatype_id"

    # Create indexes
    add_index :properties, [:website_id, :code], :unique
    add_index :properties, [:website_id, :name], :unique
  end

  def self.down
    drop_table :properties
  end
end
