class AlterArticlesAddPermalinkWithSlug < ActiveRecord::Migration
  def up
    #remove_column :products, :permalink
    add_column :articles, :permalink, :string, :limit => 255, :null => true
    add_column :articles, :slug, :string, :limit => 255, :null => true
  end

  def down
    raise "not implemented"
  end
end
