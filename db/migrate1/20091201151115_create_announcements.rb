class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.column :product_id, :integer, :null => false
      t.column :announcement_status_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.column :author_id, :integer, :null => true
      t.column :title, :string, :null => false, :limit => 256
      t.column :titlel, :string, :null => false, :limit => 256
      t.column :body, :string, :null => false, :limit => 4000
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :announcements, :products, :column => "product_id"
    add_foreign_key :announcements, :announcement_statuses, :column => "announcement_status_id"
    add_foreign_key :announcements, :users, :column => "user_id"
    add_foreign_key :announcements, :products, :column => "author_id"

    # Create indexes
    add_index :announcements, :product_id
    add_index :announcements, :announcement_status_id
    add_index :announcements, :user_id
    add_index :announcements, :author_id


  end

  def self.down
    drop_table :announcements
  end
end
