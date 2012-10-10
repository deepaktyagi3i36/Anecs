class CreateCurrencies < ActiveRecord::Migration
  def self.up
    create_table :currencies do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :sign, :string, :limit => 8, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Create constraints
    add_index :currencies, :name, :unique
    add_index :currencies, :code, :unique
    add_index :currencies, :sign, :unique
  end

  def self.down
    drop_table :currencies
  end
end
