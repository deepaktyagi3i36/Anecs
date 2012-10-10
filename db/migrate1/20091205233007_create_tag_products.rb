class CreateTagProducts < ActiveRecord::Migration
  def self.up
    create_table :tag_products do |t|
      t.column :tag_id, :integer, :null => false
      t.column :product_id, :integer, :null => false
      t.timestamps
    end

    # Add indexes
    add_index :tag_products, [:tag_id, :product_id], :unique

    # Add foreign keys
    add_foreign_key :tag_products, :tags, :column => "tag_id"
    add_foreign_key :tag_products, :products, :column => "product_id"
  end

  def self.down
    drop_table :tag_products
  end
end
