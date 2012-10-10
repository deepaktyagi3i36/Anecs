class AlterManpagesRemoveTreepath < ActiveRecord::Migration
  def up
    remove_column :manpages, :level
    remove_column :manpages, :totals
    remove_column :manpages, :childs
    remove_column :manpages, :treepath

    # Add ancestry
    add_column :manpages, :ancestry, :string

    # Create indexes
    add_index :manpages, :ancestry

    # Migrate
    # Manpage.build_ancestry_from_parent_ids!
    # Manpage.check_ancestry_integrity!

    # Remove parent id column
    #remove_foreign_key :manpages, :column => "parent_id"
    #remove_column :manpages, :parent_id
  end

  def down
    raise "not implemented"
  end
end
