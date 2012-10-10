class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.column :website_id, :integer, :null => false
      t.column :promotion_type_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :title, :string, :limit => 128, :null => false
      t.column :body, :string, :limit => 512, :null => false
      t.column :begin_dt, :datetime, :null => false
      t.column :finish_dt, :datetime, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :promotions, :websites, :column => "website_id"
    add_foreign_key :promotions, :promotion_types, :column => "promotion_type_id"

    # Add indexes
    add_index :promotions, :code, :unique
    add_index :promotions, :name, :unique
  end

  def self.down
    drop_table :promotions
  end
end
