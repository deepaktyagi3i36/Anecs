class CreateUserTags < ActiveRecord::Migration
  def self.up
    create_table :user_tags do |t|
      t.column :tag_id, :integer, :null => true
      t.column :user_id, :integer, :null => true
      t.timestamps
    end

    # Add indexes
    add_index :user_tags, [:tag_id, :user_id], :unique

    # Add foreign keys
    add_foreign_key :user_tags, :tags, :column => "tag_id"
    add_foreign_key :user_tags, :users, :column => "user_id"

  end

  def self.down
    drop_table :user_tags
  end
end
