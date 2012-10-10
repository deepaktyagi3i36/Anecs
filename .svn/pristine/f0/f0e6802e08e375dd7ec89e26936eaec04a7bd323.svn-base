class CreatePromoitems < ActiveRecord::Migration
  def self.up
    create_table :promoitems do |t|
      t.column :product_id, :integer, :null => false
      t.column :promotion_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :promoitems, :products, :column => "product_id"
    add_foreign_key :promoitems, :promotions, :column => "promotion_id"

    # Create indexes
    add_index :promoitems, [:product_id, :promotion_id], :unique
  end

  def self.down
    drop_table :promoitems
  end
end
