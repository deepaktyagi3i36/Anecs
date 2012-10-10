class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.column :user_id, :integer, :null => false
      t.column :option_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :settings, :users, :column => "user_id"
    add_foreign_key :settings, :options, :column => "option_id"

    # Create indexes
    add_index :settings, [:user_id, :option_id], :unique

  end

  def self.down
    drop_table :settings
  end
end
