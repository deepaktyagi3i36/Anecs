class AlterOrdersRemoveDefault < ActiveRecord::Migration
  def self.up
    # Remove foreign keys
    # remove_foreign_key :orders, :column => "region_id"

    # Add columns
    remove_column :orders, :region_id
    add_column :orders, :region_id, :integer, :null => false

    # Add foreign keys
    add_foreign_key :orders, :regions, :column => "region_id"
  end

  def self.down
  end
end
