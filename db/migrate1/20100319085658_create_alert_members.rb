class CreateAlertMembers < ActiveRecord::Migration
  def self.up
    create_table :alert_members do |t|
      t.column :alert_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :alert_members, :alerts, :column => "alert_id"
    add_foreign_key :alert_members, :users, :column => "user_id"

    # Create indexes
    add_index :alert_members, [:alert_id, :user_id], :unique

  end

  def self.down
    drop_table :alert_members
  end
end
