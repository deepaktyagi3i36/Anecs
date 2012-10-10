class CreateVacancies < ActiveRecord::Migration
  def self.up
    # TODO: erase code
    return if self.table_exists?("vacancies")
    create_table :vacancies do |t|
      t.column :website_id, :integer, :null => false
      t.column :name, :string, :limit => 128, :null => false
      t.column :namel, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :title, :string, :null => false, :limit => 255
      t.column :body, :string, :null => false, :limit => 4000
      t.column :region_id, :integer, :null => false
      t.column :enabled, :integer, :null=>false, :default => 0
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :vacancies, :websites, :column => "website_id"
    add_foreign_key :vacancies, :regions, :column => "region_id"

    # Create indexes
    add_index :vacancies, :name, :unique
    add_index :vacancies, :region_id
  end

  def self.down
    drop_table :vacancies
  end
end
