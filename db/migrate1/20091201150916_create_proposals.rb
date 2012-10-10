class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.column :website_id, :integer, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :proposals, :websites, :column => "website_id"

    # Create indexes
    add_index :proposals, [:website_id, :code], :unique
    add_index :proposals, [:website_id, :name], :unique
  end

  def self.down
    drop_table :proposals
  end
end

