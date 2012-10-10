class CreateAddressTypes < ActiveRecord::Migration

  def self.up
    create_table :address_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null => false, :default => 1
      t.timestamps
    end

    # Create constraints
    add_index :address_types, :name, :unique
    add_index :address_types, :code, :unique
  end

  def self.down
    drop_table :address_types
  end
end
