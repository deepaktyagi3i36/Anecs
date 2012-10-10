class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :countries, :name, :unique
    add_index :countries, :code, :unique
  end

  def self.down
    drop_table :countries
  end
end
