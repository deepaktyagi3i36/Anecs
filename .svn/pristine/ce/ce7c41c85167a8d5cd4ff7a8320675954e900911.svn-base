class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :website_id, :integer, :null => false
      t.column :product_type_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :sketch, :string, :limit => 1024, :null => true
      t.column :about, :string, :limit => 8192, :null => false
      t.column :rating, :decimal, :null => false, :default => 0
      t.column :metakeywords, :string, :limit => 255, :null => true
      t.column :metadescription, :text, :limit => 65535, :null => true
      t.column :wwwaddress, :string, :limit => 255, :null => true
      t.column :permalink, :string, :limit => 255, :null => true
      t.column :slug, :string, :limit => 255, :null => true
      t.column :weight, :integer, :null => false, :default => 0
      t.column :ancestry, :string, :limit => 255, :null => true
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :products, :websites, :column => "website_id"
    add_foreign_key :products, :product_types, :column => "product_type_id"


    # Create indexes
    add_index :products, :code, :unique
    add_index :products, :permalink, :unique
    add_index :products, :metakeywords, :unique
    add_index :products, :ancestry
  end

  def self.down
    drop_table :products
  end
end

