class DropViewTypes < ActiveRecord::Migration
  def self.up
    remove_foreign_key :products, :column => "view_type_id"
    remove_column :products, :view_type_id
    drop_table :view_types
  end

  def self.down
    raise "not implemented"
  end
end
