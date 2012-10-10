class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :product_id, :integer, :null => false
      t.column :primary, :integer, :null => false, :default => false
      # Paperclip
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.timestamps
    end
    # Add foreign keys
    add_foreign_key :photos, :products, :column => "product_id"

    # Create indexes
    add_index :photos, :product_id
  end

  def self.down
    drop_table :photos
  end
end
