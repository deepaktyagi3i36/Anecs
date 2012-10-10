class CreatePromotionFunctors < ActiveRecord::Migration
  def self.up
    create_table :promotion_functors do |t|
      t.column :promotion_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :promotion_functors, :promotions, :column => "promotion_id"

    # Add indexes
    add_index :promotion_functors, :promotion_id
    add_index :promotion_functors, :name, :unique
  end

  def self.down
    drop_table :promotion_functors
  end
end
