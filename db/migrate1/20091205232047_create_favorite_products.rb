class CreateFavoriteProducts < ActiveRecord::Migration
  def self.up
    create_table :favorite_products do |t|
      t.column :favorite_id, :integer, :null => false
      t.column :product_id, :integer, :null => false
      t.timestamps
    end

    # Add indexes
    add_index :favorite_products, [:favorite_id, :product_id], :unique

    # Add foreign keys
    add_foreign_key :favorite_products, :favorites, :column => "favorite_id"
    add_foreign_key :favorite_products, :products, :column => "product_id"
  end

  def self.down
    drop_table :favorite_items
  end
end
