class CreatePrivacyMembers < ActiveRecord::Migration
  def self.up
    create_table :privacy_members do |t|
      t.column :privacy_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :privacy_members, :privacies, :column => "privacy_id"
    add_foreign_key :privacy_members, :users, :column => "user_id"

    # Create indexes
    add_index :privacy_members, [:privacy_id, :user_id], :unique
  end

  def self.down
    drop_table :privacy_members
  end
end
