class CreateInvalidRoutes < ActiveRecord::Migration
  def self.up
    create_table :invalid_routes do |t|
      t.column :priority, :integer, :null => false
      t.column :pattern, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null=>false, :default => 1
      t.timestamps
    end

    # Add indexes
    add_index :invalid_routes, :pattern, :unique
  end

  def self.down
    drop_table :invalid_routes
  end
end
