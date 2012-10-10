class CreateViewTypeItems < ActiveRecord::Migration
  def self.up
    create_table :view_type_items do |t|
      t.column :view_type_id, :integer, :null => false
      t.column :view_id, :integer, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :view_type_items, :view_types, :column => "view_type_id"
    add_foreign_key :view_type_items, :views, :column => "view_id"

    # Create constraints
    add_index :view_type_items, [:view_type_id, :view_id], :unique
  end

  def self.down
    drop_table :view_type_items
  end
end
