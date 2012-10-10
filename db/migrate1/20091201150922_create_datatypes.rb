class CreateDatatypes < ActiveRecord::Migration
  def self.up
    create_table :datatypes do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :datatypes, :name, :unique
    add_index :datatypes, :code, :unique
  end

  def self.down
    drop_table :datatypes
  end
end
