class CreateOpinionStatuses < ActiveRecord::Migration
  def self.up
    create_table :opinion_statuses do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :opinion_statuses, :name, :unique
    add_index :opinion_statuses, :code, :unique
  end

  def self.down
    drop_table :opinion_statuses
  end
end
