class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :locale, :string, :limit => 8, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Create constraints
    add_index :languages, :name, :unique
    add_index :languages, :code, :unique
    add_index :languages, :locale, :unique
  end

  def self.down
    drop_table :languages
  end
end
