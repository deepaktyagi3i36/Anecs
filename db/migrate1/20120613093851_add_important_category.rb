class AddImportantCategory < ActiveRecord::Migration
  def up
    add_column :categories, :important, :integer, :default => 0
  end

  def down
    remove_column :categories, :important
  end
end
