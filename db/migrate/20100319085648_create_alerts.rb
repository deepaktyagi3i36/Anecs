class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.column :user_id, :integer, :null => false
      t.column :alert_type_id, :integer, :null => false
      t.column :alert_value_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :alerts, :users, :column => "user_id"
    add_foreign_key :alerts, :alert_types, :column => "alert_type_id"
    add_foreign_key :alerts, :alert_values, :column => "alert_value_id"

    # Create indexes
    add_index :alerts, [:user_id, :alert_type_id], :unique
  end

  def self.down
    drop_table :alerts
  end
end
