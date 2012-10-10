class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.column :product_id, :integer, :null => false
      t.column :comment_status_id, :integer, :null => false
      t.column :comment_type_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.column :author_id, :integer, :null => true
      t.column :title, :string, :null => false, :limit => 256
      t.column :titlel, :string, :null => false, :limit => 256
      t.column :body, :string, :null => false, :limit => 4000
      t.column :rating, :integer, :null => false
      t.column :useful, :integer, :null => false
      t.column :useless, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :comments, :products, :column => "product_id"
    add_foreign_key :comments, :comment_statuses, :column => "comment_status_id"
    add_foreign_key :comments, :comment_types, :column => "comment_type_id"
    add_foreign_key :comments, :users, :column => "user_id"
    add_foreign_key :comments, :products, :column => "author_id"

    # Create indexes
    add_index :comments, :product_id
    add_index :comments, :comment_status_id
    add_index :comments, :user_id
    add_index :comments, :author_id
    add_index :comments, :titlel
  end

  def self.down
    drop_table :comments
  end
end
