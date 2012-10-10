class CreateProductTypes < ActiveRecord::Migration
  def self.up
    create_table :product_types do |t|
      t.column :website_id, :integer, :null => false
      t.column :proposal_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :product_types, :websites, :column => "website_id"

    # Create constraints
    add_index :product_types, [:website_id, :code], :unique
    add_index :product_types, [:website_id, :name], :unique
  end

  def self.down
    drop_table :product_types
  end
end
