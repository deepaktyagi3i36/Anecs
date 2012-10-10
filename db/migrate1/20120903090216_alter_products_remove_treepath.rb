class AlterProductsRemoveTreepath < ActiveRecord::Migration
  def up
    remove_column :products, :level
    remove_column :products, :totals
    remove_column :products, :childs
    remove_column :products, :treepath

    # Add ancestry
    add_column :products, :ancestry, :string

    # Create indexes
    add_index :products, :ancestry

    # Migrate
    #Product.build_ancestry_from_parent_ids!
    #Product.check_ancestry_integrity!

    # Remove parent id column
    #remove_foreign_key :products, :column => "parent_id"
    #remove_column :products, :parent_id
    #remove_foreign_key :products, :column => "root_id"
    #remove_column :products, :root_id
  end

  def down
    raise "not implemented"
  end
end
