class CreateShippingTypes < ActiveRecord::Migration

  def self.up
    create_table :shipping_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null => false, :default => 1
      t.timestamps
    end

    # Create constraints
    add_index :shipping_types, :name, :unique
    add_index :shipping_types, :code, :unique
  end

  def self.down
    drop_table :shipping_types
  end
end
