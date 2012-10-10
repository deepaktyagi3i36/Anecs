class CreatePrivacyTypes < ActiveRecord::Migration
  def self.up
    create_table :privacy_types do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.timestamps
    end

    # Create constraints
    add_index :privacy_types, :name, :unique
    add_index :privacy_types, :code, :unique
  end

  def self.down
    drop_table :privacy_types
  end
end
