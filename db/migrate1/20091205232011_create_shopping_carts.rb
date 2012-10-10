class CreateShoppingCarts < ActiveRecord::Migration
  def self.up
    create_table :shopping_carts do |t|
      t.column :website_id, :integer, :null => false
      t.column :user_id, :integer, :null => true
      t.column :session_id, :integer, :null => true
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :shopping_carts, :websites, :column => "website_id"
    add_foreign_key :shopping_carts, :users, :column => "user_id"
    add_foreign_key :shopping_carts, :sessions, :column => "session_id"

    # Add indexes
    add_index :shopping_carts, :user_id, :unique
    add_index :shopping_carts, :session_id, :unique
  end

  def self.down
    drop_table :shopping_carts
  end
end
