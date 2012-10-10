class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.column :website_id, :integer, :null => false
      t.column :user_id, :integer, :null => true
      t.column :contact_type_id, :integer, :null => false
      t.column :contact_status_id, :integer, :null => false
      t.column :title, :string, :limit => 128, :null => false
      t.column :body, :string, :limit => 512, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :feedbacks, :websites, :column => "website_id"
    add_foreign_key :feedbacks, :users, :column => "user_id"
    add_foreign_key :feedbacks, :contact_types, :column => "contact_type_id"
    add_foreign_key :feedbacks, :contact_statuses, :column => "contact_status_id"

    # Add indexes
    add_index :feedbacks, :user_id
    add_index :feedbacks, :contact_type_id
    add_index :feedbacks, :contact_status_id
  end

  def self.down
    drop_table :feedbacks
  end
end
