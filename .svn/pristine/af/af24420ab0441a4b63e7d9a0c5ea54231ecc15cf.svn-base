class CreateWebsiteCurrencies < ActiveRecord::Migration
  def self.up
    create_table :website_currencies do |t|
      t.column :website_id, :integer, :null => false
      t.column :currency_id, :integer, :null => false
      t.column :primary, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :website_currencies, :websites, :column => "website_id"
    add_foreign_key :website_currencies, :currencies, :column => "currency_id"

    # Create indexes
    add_index :website_currencies, [:website_id, :currency_id], :unique
  end

  def self.down
    drop_table :currencies
  end
end
