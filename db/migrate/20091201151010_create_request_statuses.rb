class CreateRequestStatuses < ActiveRecord::Migration
  def self.up
    create_table :request_statuses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :request_statuses, :name, :unique
    add_index :request_statuses, :code, :unique
  end

  def self.down
    drop_table :request_statuses
  end
end
