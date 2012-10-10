class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :product_id, :integer, :null => false
      t.column :name, :string, :limit => 64, :null => false
      t.column :about, :string, :limit => 256, :null => false

      # For google map
      t.column :latitude, :decimal, :precision => 9, :scale => 6, :null => false
      t.column :longitude, :decimal, :precision => 9, :scale => 6, :null => false
      t.column :zoom, :integer, :null => false
      t.column :title, :string, :limit => 64, :null => false
      t.column :body, :string, :limit => 256, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :contacts, :products, :column => "product_id"
  end

  def self.down
    drop_table :contacts
  end
end
