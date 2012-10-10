class CreateBookcases < ActiveRecord::Migration
  def self.up
    create_table :bookcases do |t|
      t.column :product_id, :integer, :null => false
      t.column :article_id, :integer, :null => false
      t.column :annotation, :string, :limit => 16384, :null => false
      t.column :position, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :bookcases, :products, :column => "product_id"
    add_foreign_key :bookcases, :articles, :column => "article_id"

    # Create indexes
    add_index :bookcases, [:product_id, :article_id], :unique
  end

  def self.down
    drop_table :bookcases
  end
end
