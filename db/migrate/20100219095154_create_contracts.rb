class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.column :contract_type_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :contracts, :contract_types, :column => "contract_type_id"
  end

  def self.down
    drop_table :contracts
  end
end
