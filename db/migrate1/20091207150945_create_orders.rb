class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => true
      t.column :session_id, :integer, :null => true
      t.column :region_id, :integer, :null => false
      t.column :order_state_id, :integer, :null => false
      t.column :user_id, :integer, :null => true
      t.column :shipping_type_id, :integer, :null => true
      t.column :payment_type_id, :integer, :null => true
      t.column :address_id, :integer, :null => true
      t.column :checkout_state_id, :integer, :null => false
      t.column :total_items, :integer, :null => false
      t.column :total_price, :decimal, :precision => 10, :scale => 2, :null => false
      t.column :shipping_address, :string, :limit => 1024, :null => true
      t.column :email, :string, :limit => 128, :null => true
      t.column :user_name, :string, :limit => 128, :null => true
      t.column :notes, :string, :limit => 128, :null => true
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :orders, :websites, :column => "website_id"
    add_foreign_key :orders, :sessions, :column => "session_id"
    add_foreign_key :orders, :users, :column => "user_id"
    add_foreign_key :orders, :order_states, :column => "order_state_id"
    add_foreign_key :orders, :shipping_types, :column => "shipping_type_id"
    add_foreign_key :orders, :payment_types, :column => "payment_type_id"
    add_foreign_key :orders, :addresses, :column => "address_id"
    add_foreign_key :orders, :checkout_states, :column => "checkout_state_id"

    # Create indexes
    add_index :orders, :name
    add_index :orders, :user_id
    add_index :orders, :session_id, :unique
  end

  def self.down
    drop_table :orders
  end
end
