class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.column :storehouse_id, :integer, :null => false
      t.column :variant_id, :integer, :null => false
      t.column :quantity, :integer, :null => false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :inventories, :storehouses, :column => "storehouse_id"
    add_foreign_key :inventories, :variants, :column => "variant_id"

    # Create indexes
    add_index :inventories, [:storehouse_id, :variant_id ], :unique
  end

  def self.down
    drop_table :inventories
  end
end
