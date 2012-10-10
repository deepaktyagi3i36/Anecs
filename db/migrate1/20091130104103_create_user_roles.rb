class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table :user_roles do |t|
      t.column :user_id, :integer, :null => false
      t.column :role_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :user_roles, :users, :column => "user_id"
    add_foreign_key :user_roles, :roles, :column => "role_id"

    # Create indexes
    add_index :user_roles, [:user_id, :role_id], :unique
  end

  def self.down
    drop_table :user_roles
  end
end
