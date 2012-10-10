class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.column :category_id, :integer, :null => false
      t.column :product_id, :integer, :null => false
      t.column :bubble, :integer, :null=>false, :default => 1
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :connections, :categories, :column => "category_id"
    add_foreign_key :connections, :products, :column => "product_id"

    # Create indexes
    add_index :connections, [:category_id, :product_id], :unique
  end

  def self.down
    drop_table :connections
  end
end
