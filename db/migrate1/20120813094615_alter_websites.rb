class AlterWebsites < ActiveRecord::Migration
  def self.up
    remove_column :websites, :aggregator
  end

  def self.down
    add_column :websites, :aggregator, :integer, :null=>false, :default => 0
  end
end
