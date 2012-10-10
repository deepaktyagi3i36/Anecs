class CreateContactStatuses < ActiveRecord::Migration
  def self.up
    create_table :contact_statuses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add indexes
    add_index :contact_statuses, :name, :unique
    add_index :contact_statuses, :code, :unique
  end

  def self.down
    drop_table :contact_statuses
  end
end
