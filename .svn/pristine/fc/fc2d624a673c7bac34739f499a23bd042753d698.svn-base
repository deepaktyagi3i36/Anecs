class CreateWebsiteLanguages < ActiveRecord::Migration
  def self.up
    # TODO: erase code
    return if self.table_exists?("website_languages")
    create_table :website_languages do |t|
      t.column :website_id, :integer, :null => false
      t.column :language_id, :integer, :null => false
      t.column :primary, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :website_languages, :websites, :column => "website_id"
    add_foreign_key :website_languages, :languages, :column => "language_id"

    # Create indexes
    add_index :website_languages, [:website_id, :language_id], :unique
  end

  def self.down
    drop_table :languages
  end
end
