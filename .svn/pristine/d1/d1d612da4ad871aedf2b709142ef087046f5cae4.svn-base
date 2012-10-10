class CreateContractTypes < ActiveRecord::Migration
  def self.up
    create_table :contract_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :contract_types, :name, :unique
    add_index :contract_types, :code, :unique
  end

  def self.down
    drop_table :contract_types
  end
end
