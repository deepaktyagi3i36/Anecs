class CreateInstructions < ActiveRecord::Migration
  def self.up
    create_table :instructions do |t|
      t.column :product_id, :integer, :null => false
      t.column :position, :integer, :null => false
      t.column :pattern_id, :integer, :null => true
      t.column :title, :string, :null => false, :limit => 256
      t.column :body, :string, :null => false, :limit => 16384
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :instructions, :products, :column => "product_id"
    add_foreign_key :instructions, :patterns, :column => "pattern_id"

    # Create indexes
    add_index :instructions, [:product_id, :position], :unique

  end

  def self.down
    drop_table :instructions
  end
end
