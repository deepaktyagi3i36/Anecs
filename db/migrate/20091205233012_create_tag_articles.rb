class CreateTagArticles < ActiveRecord::Migration
  def self.up
    create_table :tag_articles do |t|
      t.column :tag_id, :integer, :null => false
      t.column :article_id, :integer, :null => false
      t.timestamps
    end

    # Add indexes
    add_index :tag_articles, [:tag_id, :article_id], :unique

    # Add foreign keys
    add_foreign_key :tag_articles, :tags, :column => "tag_id"
    add_foreign_key :tag_articles, :articles, :column => "article_id"
  end

  def self.down
    drop_table :tag_articles
  end
end
