class CreateProductTypeProperties < ActiveRecord::Migration
  def self.up
    create_table :product_type_properties do |t|
      t.column :product_type_id, :integer, :null => false
      t.column :property_id, :integer, :null => false
      t.timestamps
    end

    # Create indexes
    add_index :product_type_properties, [:product_type_id, :property_id], {:unique => true, :name => "producttp_properties_on_producttp_id_and_property_id"}

    # Add foreign keys
    add_foreign_key :product_type_properties, :product_types, :column => "product_type_id"
    add_foreign_key :product_type_properties, :properties, :column => "property_id"
  end

  def self.down
    drop_table :product_type_properties
  end
end
