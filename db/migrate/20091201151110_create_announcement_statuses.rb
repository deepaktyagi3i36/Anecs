class CreateAnnouncementStatuses < ActiveRecord::Migration
  def self.up
    create_table :announcement_statuses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :announcement_statuses, :name, :unique
    add_index :announcement_statuses, :code, :unique
  end

  def self.down
    drop_table :announcement_statuses
  end
end
