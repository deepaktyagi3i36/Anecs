class CreatePaymentTypes < ActiveRecord::Migration

  def self.up
    create_table :payment_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :enabled, :integer, :null => false, :default => 1
      t.timestamps
    end

    # Create constraints
    add_index :payment_types, :name, :unique
    add_index :payment_types, :code, :unique

  end

  def self.down
    drop_table :payment_types
  end
end
