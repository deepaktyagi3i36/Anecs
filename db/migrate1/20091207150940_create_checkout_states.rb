class CreateCheckoutStates < ActiveRecord::Migration
  def self.up
    create_table :checkout_states do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :checkout_states, :code, :unique
    add_index :checkout_states, :name, :unique

  end

  def self.down
    drop_table :checkout_states
  end
end
