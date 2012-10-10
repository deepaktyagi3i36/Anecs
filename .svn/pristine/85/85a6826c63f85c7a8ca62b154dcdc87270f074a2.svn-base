class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.column :website_id, :integer, :null => false
      t.column :article_type_id,:integer, :null => false
      t.column :name, :string, :limit =>128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 64, :null => false
      t.column :annotation, :string, :limit => 5000, :null => true
      t.column :content, :text, :limit => 16777214, :null => true
      t.column :pagetitle, :string, :limit =>128, :null => false
      t.column :metakeywords, :string, :limit =>255, :null => false
      t.column :metadescription, :text, :limit =>65535, :null => false

      t.column :parent_id, :integer, :null => true
      t.column :level, :integer, :null => false
      t.column :totals, :integer, :null => false, :default => 0
      t.column :childs, :integer, :null => false, :default => 0
      t.column :weight, :integer, :null => false, :default => 0
      t.column :treepath, :string, :limit =>255, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0

      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :articles, :websites, :column => "website_id"
    add_foreign_key :articles, :article_types, :column => "article_type_id"
    add_foreign_key :articles, :articles, :column => "parent_id"


    # Create indexes
    add_index :articles, :name, :unique
    add_index :articles, :code, :unique
    # Nulls availables
    # add_index :articles, :annotation, :unique
    # add_index :articles, :content, :unique
    add_index :articles, :pagetitle, :unique
    add_index :articles, :metakeywords, :unique

    add_index :articles, :parent_id
    add_index :articles, :treepath, :unique
    add_index :articles, [:id, :parent_id], :unique

  end

  def self.down
    drop_table :articles
  end
end
