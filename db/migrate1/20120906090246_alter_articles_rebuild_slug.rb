class AlterArticlesRebuildSlug < ActiveRecord::Migration
  def up
    # Migrate
    Article.build_ancestry_from_parent_ids!
    Article.check_ancestry_integrity!

    # Remove parent id column
    remove_foreign_key :articles, :column => "parent_id"
    remove_column :articles, :parent_id

    # Iterate
    Article.find(:all).each do |article|
      if article.permalink.nil? || article.permalink.blank?
        article.permalink = article.name
        article.slug = article.permalink
        article.save!
      else
        article.slug = article.permalink
        article.save!
      end
    end
  end

  def down
    raise "not implemented"
  end
end
