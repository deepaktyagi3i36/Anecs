class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :domain, :string, :limit => 128, :null => false
      t.column :aggregator, :integer, :null=>false, :default => 0
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Create constraints
    add_index :websites, :name, :unique
    add_index :websites, :code, :unique
  end

  def self.down
    drop_table :webistes
  end
end
