class CreateVariants < ActiveRecord::Migration
  def self.up
    create_table :variants do |t|
      t.column :product_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :currency_id, :integer, :null => false
      t.column :price, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.0
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Create indexes
    add_index :variants, :product_id

    # Add foreign keys
    add_foreign_key :variants, :products, :column => "product_id"
    add_foreign_key :variants, :currencies, :column => "currency_id"
  end

  def self.down
    drop_table :variants
  end
end
