class DropPresentations < ActiveRecord::Migration
  def self.up
    remove_foreign_key :products, :column => "presentation_id"
    remove_column :products, :presentation_id
    drop_table :presentations
  end

  def self.down
    raise "not implemented"
  end
end
