class CreateOrderVariants < ActiveRecord::Migration
  def self.up
    create_table :order_variants do |t|
      t.column :order_id, :integer, :null => false
      t.column :variant_id, :integer, :null => false
      t.column :product_nm, :string, :limit => 128, :null => false
      t.column :variant_nm, :string, :limit => 128, :null => false
      t.column :quantity, :integer, :null => false
      t.column :currency_id, :integer, :null => false
      t.column :price, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.0
      t.timestamps
    end

    # Create indexes
    add_index :order_variants, [:order_id, :variant_id], :unique

    # Add foreign keys
    add_foreign_key :order_variants, :orders, :column => "order_id"
    add_foreign_key :order_variants, :variants, :column => "variant_id"
    add_foreign_key :order_variants, :currencies, :column => "currency_id"
  end

  def self.down
    drop_table :order_variants
  end
end
