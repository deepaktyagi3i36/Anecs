class AddImportantProduct < ActiveRecord::Migration
  def up
    add_column :products, :important, :integer, :default => 0
  end

  def down
    remove_column :products, :important
  end
end
