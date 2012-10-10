class RemoveImportantProduct < ActiveRecord::Migration
  def up
    remove_column :products, :important
  end

  def down
    add_column :products, :important, :integer, :default => 0
  end
end
