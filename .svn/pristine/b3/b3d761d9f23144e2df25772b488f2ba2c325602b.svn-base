class CreateOrderVariantProperties < ActiveRecord::Migration
  def self.up
    create_table :order_variant_properties do |t|
      t.column :order_variant_id, :integer, :null => false
      t.column :property_nm, :string, :null => false
      t.column :value, :string, :null => false
      t.timestamps
    end

    # Create indexes
    add_index :order_variant_properties, [:order_variant_id, :property_nm], :unique => true, :name => "index_order_variant_properties_on_ordvar_id_and_prop_nm"

    # Add foreign keys
    add_foreign_key :order_variant_properties, :order_variants, :column => "order_variant_id"
  end

  def self.down
    drop_table :order_variant_properties
  end
end
