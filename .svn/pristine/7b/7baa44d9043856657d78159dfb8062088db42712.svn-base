class CreateComplaints < ActiveRecord::Migration
  def self.up
    create_table :complaints do |t|
      t.column :user_id, :integer, :null => false
      t.column :complaint_type_id, :integer, :null => false
      t.column :complaint_status_id, :integer, :null => false
      t.column :title, :string, :limit => 128, :null => false
      t.column :body, :string, :limit => 512, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :complaints, :users, :column => "user_id"
    add_foreign_key :complaints, :complaint_types, :column => "complaint_type_id"
    add_foreign_key :complaints, :complaint_statuses, :column => "complaint_status_id"

    # Add indexes
    add_index :complaints, :user_id
    add_index :complaints, :complaint_type_id
    add_index :complaints, :complaint_status_id
  end

  def self.down
    drop_table :complaints
  end
end
