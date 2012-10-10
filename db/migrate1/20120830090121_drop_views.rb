class DropViews < ActiveRecord::Migration
  def self.up
    drop_table :views
  end

  def self.down
    raise "not implemented"
  end
end
