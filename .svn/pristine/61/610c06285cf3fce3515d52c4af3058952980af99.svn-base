class CreateComplaintTypes < ActiveRecord::Migration
  def self.up
    create_table :complaint_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add indexes
    add_index :complaint_types, :name, :unique
    add_index :complaint_types, :code, :unique
  end

  def self.down
    drop_table :complaint_types
  end
end
