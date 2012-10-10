class CreateComparators < ActiveRecord::Migration
  def self.up
    create_table :comparators do |t|
      t.column :website_id, :integer, :null => false
      t.column :user_id, :integer, :null => true
      t.column :session_id, :integer, :null => true
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :comparators, :websites, :column => "website_id"
    add_foreign_key :comparators, :users, :column => "user_id"
    add_foreign_key :comparators, :sessions, :column => "session_id"

    # Add indexes
    add_index :comparators, :user_id, :unique
    add_index :comparators, :session_id, :unique
  end

  def self.down
    drop_table :comparators
  end
end

