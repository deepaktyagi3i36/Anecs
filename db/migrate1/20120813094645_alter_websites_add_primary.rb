class AlterWebsitesAddPrimary < ActiveRecord::Migration
  def self.up
    add_column :websites, :primary, :integer, :null=>false, :default => 0
    Website.reset_column_information
  end

  def self.down
    remove_column :websites, :primary
    Website.reset_column_information
  end
end
