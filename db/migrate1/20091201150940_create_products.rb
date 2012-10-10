class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :website_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :sketch, :string, :limit => 1024, :null => true
      t.column :about, :string, :limit => 8192, :null => false
      t.column :proposal_id, :integer, :null => false
      t.column :view_type_id, :integer, :null => false
      t.column :presentation_id, :integer, :null => false
      t.column :product_type_id, :integer, :null => false
      t.column :user_rating, :decimal, :null => false, :default => 0
      t.column :expert_rating, :decimal, :null => false, :default =>0

      t.column :permalink, :string, :limit => 255, :null => true
      t.column :metakeywords, :string, :limit => 255, :null => true
      t.column :metadescription, :text, :limit => 65535, :null => true
      t.column :wwwaddress, :string, :limit => 255, :null => true
      t.column :enabled, :integer, :null=>false, :default => 0

      # Information to support tree for product
      t.column :root_id, :integer, :null => true
      t.column :parent_id, :integer, :null => true
      t.column :level, :integer, :null => false
      t.column :totals, :integer, :null => false, :default => 0
      t.column :childs, :integer, :null => false, :default => 0
      t.column :treepath, :string, :limit =>255, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :products, :websites, :column => "website_id"
    add_foreign_key :products, :proposals, :column => "proposal_id"
    add_foreign_key :products, :view_types, :column => "view_type_id"
    add_foreign_key :products, :presentations, :column => "presentation_id"
    add_foreign_key :products, :product_types, :column => "product_type_id"
    add_foreign_key :products, :products, :column => "root_id"
    add_foreign_key :products, :products, :column => "parent_id"


    # Create indexes
    add_index :products, :code, :unique
    add_index :products, :permalink, :unique
    add_index :products, :metakeywords, :unique
    add_index :products, :proposal_id
    add_index :products, :treepath
    add_index :products, [:id, :parent_id], :unique
  end

  def self.down
    drop_table :products
  end
end

