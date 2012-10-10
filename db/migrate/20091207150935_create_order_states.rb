class CreateOrderStates < ActiveRecord::Migration

  def self.up
    create_table :order_states do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :order_states, :name, :unique
    add_index :order_states, :code, :unique
  end

  def self.down
    drop_table :order_states
  end
end
