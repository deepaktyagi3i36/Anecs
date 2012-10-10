class CreateUserStatuses < ActiveRecord::Migration
  def self.up
    create_table :user_statuses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :user_statuses, :name, :unique
    add_index :user_statuses, :code, :unique
  end



  def self.down
    drop_table :user_statuses
  end
end
