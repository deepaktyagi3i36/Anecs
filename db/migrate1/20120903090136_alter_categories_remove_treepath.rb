class AlterCategoriesRemoveTreepath < ActiveRecord::Migration
  def up
    remove_column :categories, :level
    remove_column :categories, :totals
    remove_column :categories, :childs
    remove_column :categories, :treepath

    # Add ancestry
    add_column :categories, :ancestry, :string

    # Create indexes
    add_index :categories, :ancestry

    # Migrate
    #Category.build_ancestry_from_parent_ids!
    #Category.check_ancestry_integrity!

    # Remove parent id column
    #remove_foreign_key :categories, :column => "parent_id"
    #remove_column :categories, :parent_id
    #remove_foreign_key :categories, :column => "root_id"
    #remove_column :categories, :root_id
  end

  def down
    raise "not implemented"
  end
end
