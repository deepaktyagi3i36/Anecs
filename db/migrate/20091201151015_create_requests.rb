class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.column :parent_id, :integer, :null => true
      t.column :product_id, :integer, :null => false
      t.column :request_status_id, :integer, :null => false
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
    add_foreign_key :requests, :requests, :column => "parent_id"
    add_foreign_key :requests, :products, :column => "product_id"
    add_foreign_key :requests, :request_statuses, :column => "request_status_id"
    add_foreign_key :requests, :users, :column => "user_id"
    add_foreign_key :requests, :products, :column => "author_id"

    # Create indexes
    add_index :requests, :product_id
    add_index :requests, :request_status_id
    add_index :requests, :user_id
    add_index :requests, :author_id
    add_index :requests, :titlel

  end

  def self.down
    drop_table :requests
  end
end
