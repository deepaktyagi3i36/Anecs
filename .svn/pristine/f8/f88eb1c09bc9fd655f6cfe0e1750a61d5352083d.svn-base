class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.column :product_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :agents, :products, :column => "product_id"
    add_foreign_key :agents, :users, :column => "user_id"

    # Create indexes
    add_index :agents, [:product_id, :user_id], :unique

  end

  def self.down
    drop_table :agents
  end
end
