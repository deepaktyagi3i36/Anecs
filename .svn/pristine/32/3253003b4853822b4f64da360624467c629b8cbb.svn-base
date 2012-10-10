class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.column :user_id, :integer, :null => true
      t.timestamps
    end

    # Add indexes
    add_index :favorites, :user_id, :unique

    # Add foreign keys
    add_foreign_key :favorites, :users, :column => "user_id"

  end

  def self.down
    drop_table :favorites
  end
end
