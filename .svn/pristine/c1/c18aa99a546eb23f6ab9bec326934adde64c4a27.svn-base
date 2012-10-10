class CreateViewTypes < ActiveRecord::Migration
  def self.up
    create_table :view_types do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :view_types, :websites, :column => "website_id"

    # Create constraints
    add_index :view_types, [:website_id, :code], :unique
    add_index :view_types, [:website_id, :name], :unique
  end

  def self.down
    drop_table :view_types
  end
end
