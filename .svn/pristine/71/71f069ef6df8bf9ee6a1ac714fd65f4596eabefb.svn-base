class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :options, :name, :unique
    add_index :options, :code, :unique

  end

  def self.down
    drop_table :options
  end
end
