class CreatePatterns < ActiveRecord::Migration
  def self.up
    create_table :patterns do |t|
      t.column :website_id, :integer, :null => false
      t.column :pattern_type_id, :integer, :null => false
      t.column :name, :string, :null => false, :limit => 128
      t.column :title, :string, :null => false, :limit => 255
      t.column :body, :string, :null => false, :limit => 4000
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :patterns, :websites, :column => "website_id"
    add_foreign_key :patterns, :pattern_types, :column => "pattern_type_id"

    # Add indexes
    add_index :patterns, :name, :unique

  end

  def self.down
    drop_table :patterns
  end
end
