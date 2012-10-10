class CreateComparatorItems < ActiveRecord::Migration
  def self.up
    create_table :comparator_items do |t|
      t.column :comparator_id, :integer, :null => false
      t.column :variant_id, :integer, :null => false
      t.timestamps
    end

    # Create indexes
    add_index :comparator_items, [:comparator_id, :variant_id], :unique

    # Add foreign keys
    add_foreign_key :comparator_items, :comparators, :column => "comparator_id"
    add_foreign_key :comparator_items, :variants, :column => "variant_id"
  end

  def self.down
    drop_table :comparator_items
  end
end
