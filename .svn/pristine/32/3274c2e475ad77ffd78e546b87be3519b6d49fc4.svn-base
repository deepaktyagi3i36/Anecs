class RemoveImportantCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :important
  end

  def down
    add_column :categories, :important, :integer, :default => 0
  end
end
