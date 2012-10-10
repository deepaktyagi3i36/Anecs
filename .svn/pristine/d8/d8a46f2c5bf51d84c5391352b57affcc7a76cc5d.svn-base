class CreateVariantProperties < ActiveRecord::Migration
  def self.up
    create_table :variant_properties do |t|
      t.column :variant_id, :integer, :null => false
      t.column :property_id, :integer, :null => false
      t.column :value, :string, :null => false
      t.timestamps
    end

    # Create indexes
    add_index :variant_properties, [:variant_id, :property_id], :unique

    # Add foreign keys
    add_foreign_key :variant_properties, :variants, :column => "variant_id"
    add_foreign_key :variant_properties, :properties, :column => "property_id"

  end

  def self.down
    drop_table :variant_properties
  end
end
