class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column :product_id, :integer, :null => false
      t.column :expert_product_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :links, :products, :column => "product_id"
    add_foreign_key :links, :products, :column => "expert_product_id"

    # Create indexes
    add_index :links, [:product_id, :expert_product_id], :unique

  end

  def self.down
    drop_table :links
  end
end
