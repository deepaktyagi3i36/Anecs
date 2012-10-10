class CreatePollings < ActiveRecord::Migration
  def self.up
    create_table :pollings do |t|
      t.column :product_id, :integer, :null => true
      t.column :user_id, :integer, :null => true
      t.column :matchurl, :string, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :pollings, :products, :column => "product_id"
    add_foreign_key :pollings, :users, :column => "user_id"

    # Create indexes
    # add_index :pollings, [:product_id, :user_id], :unique

  end

  def self.down
    drop_table :pollings
  end
end
