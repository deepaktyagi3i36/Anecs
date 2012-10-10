class AlterCategoriesRebuildSlug < ActiveRecord::Migration
  def up

    # Migrate
    Category.build_ancestry_from_parent_ids!
    Category.check_ancestry_integrity!

    # Remove parent id column
    remove_foreign_key :categories, :column => "parent_id"
    remove_column :categories, :parent_id
    remove_foreign_key :categories, :column => "root_id"
    remove_column :categories, :root_id

    # Iterate
    Category.find(:all).each do |category|
      if category.permalink.nil? || category.permalink.blank?
        category.permalink = category.name
        category.slug = category.permalink
        category.save!
      else
        category.slug = category.permalink
        category.save!
      end
    end
  end

  def down
    raise "not implemented"
  end
end
