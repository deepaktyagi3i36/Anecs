class CreatePrivacies < ActiveRecord::Migration
  def self.up
    create_table :privacies do |t|
      t.column :user_id, :integer, :null => false
      t.column :privacy_type_id, :integer, :null => false
      t.column :privacy_value_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :privacies, :users, :column => "user_id"
    add_foreign_key :privacies, :privacy_types, :column => "privacy_type_id"
    add_foreign_key :privacies, :privacy_values, :column => "privacy_value_id"

    # Create indexes
    add_index :privacies, [:user_id, :privacy_type_id], :unique
  end

  def self.down
    drop_table :privacies
  end
end
