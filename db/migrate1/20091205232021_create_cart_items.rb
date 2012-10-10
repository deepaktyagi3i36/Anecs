class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.column :shopping_cart_id, :integer, :null => false
      t.column :variant_id, :integer, :null => false
      t.column :quantity, :integer, :null => false
      t.column :saved_for_later, :integer, :null => false, :default => 0
      t.timestamps
    end

    # Create indexes
    # (we need an explicit name for this index as default generated name is too long)
    add_index :cart_items, [:shopping_cart_id, :saved_for_later, :variant_id],
      :unique => true, :name => 'index_on_shopping_cart_id_save_for_later_variant_id'

    # Add foreign keys
    add_foreign_key :cart_items, :shopping_carts, :column => "shopping_cart_id"
    add_foreign_key :cart_items, :variants, :column => "variant_id"
  end

  def self.down
    drop_table :cart_items
  end
end
