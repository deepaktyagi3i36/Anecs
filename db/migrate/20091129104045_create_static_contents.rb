class CreateStaticContents < ActiveRecord::Migration
  def self.up
    create_table :static_contents do |t|
      t.column :website_id, :integer, :null => false
      t.column :change_freq_id, :integer, :null => false
      t.column :pageurl, :string, :limit => 255, :null => false
      t.column :about, :string, :limit => 255, :null => true
      t.column :priority, :decimal, :precision => 10, :scale => 2, :null => false, :default => 0.5
      t.column :lastmod, :datetime, :null=>false, :default => Time.now
      t.column :enabled, :integer, :null=>false, :default => 1
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :static_contents, :websites, :column => "website_id"
    add_foreign_key :static_contents, :change_freqs, :column => "change_freq_id"

    # Add indexes
    add_index :static_contents, :website_id
  end

  def self.down
    drop_table :static_contents
  end
end
