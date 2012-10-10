class AlterCategoriesAddPermalinkWithSlug < ActiveRecord::Migration
  def up
    # remove_column :categories, :permalink
    add_column :categories, :permalink, :string, :limit => 255, :null => true
    add_column :categories, :slug, :string, :limit => 255, :null => true
  end

  def down
    raise "not implemented"
  end
end
