class AlterArticlesRemoveTreepath < ActiveRecord::Migration
  def up
    remove_column :articles, :level
    remove_column :articles, :totals
    remove_column :articles, :childs
    remove_column :articles, :treepath

    # Add ancestry
    add_column :articles, :ancestry, :string

    # Create indexes
    add_index :articles, :ancestry

    # Migrate
    #Article.build_ancestry_from_parent_ids!
    #Article.check_ancestry_integrity!

    # Remove parent id column
    #remove_foreign_key :articles, :column => "parent_id"
    #remove_column :articles, :parent_id
  end

  def down
    raise "not implemented"
  end
end
