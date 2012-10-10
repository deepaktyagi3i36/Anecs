class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :website_id, :integer, :null => true
      t.column :user_status_id, :integer, :null => false
      t.column :firstname, :string, :null => false
      t.column :middlename, :string, :null => true
      t.column :lastname, :string, :null => false
      t.column :nickname, :string, :null => false
      t.column :allow_email, :integer, :null=>false, :default => 0
      t.string :email, :null => false
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.boolean :active, :default => false, :null => false
      t.string :perishable_token, :null => false
      t.integer :login_count, :default => 0, :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string :last_login_ip
      t.string :current_login_ip
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :users, :websites, :column => "website_id"
    add_foreign_key :users, :user_statuses, :column => "user_status_id"

    # Create indexes
    add_index :users, :login, :unique
    add_index :users, :email, :unique
    add_index :users, :persistence_token
    add_index :users, :perishable_token
    add_index :users, :last_request_at
  end

  def self.down
    drop_table "users"
  end
end
