class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :address_type_id, :integer, :null => true
      t.column :user_id, :integer, :null => true
      t.column :full_name, :string, :limit => 1024, :null => false
      t.column :phone, :string, :limit => 32, :null => false
      t.column :extra_phone, :string, :limit => 32, :null => true
      t.column :street_address1, :string, :limit => 128, :null => false
      t.column :street_address2, :string, :limit => 128, :null => true
      t.column :city, :string, :limit => 128, :null => false
      t.column :country_id, :integer, :null => false
      t.column :zip, :string, :limit => 16, :null => true
      t.column :default, :integer, :null => false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :addresses, :address_types, :column => "address_type_id"
    add_foreign_key :addresses, :users, :column => "user_id"
    add_foreign_key :addresses, :countries, :column => "country_id"

    # Create indexes
    add_index :addresses, :name
    add_index :addresses, :user_id
  end

  def self.down
    drop_table :addresses
  end
end
