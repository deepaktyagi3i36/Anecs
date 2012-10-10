class CreateAdminJobs < ActiveRecord::Migration
  def self.up
    create_table :admin_jobs do |t|
      t.column :name, :string, :limit => 128, :null => false
      t.column :code, :string, :limit => 128, :null => false
      t.column :about, :string, :limit => 128, :null => false
      t.column :job, :string, :limit => 128, :null => false
      t.column :success, :integer, :null => false, :default => 0
      t.column :exception, :string, :limit => 5000, :null => true
      t.column :begin_at, :datetime, :null => true
      t.column :finish_at, :datetime, :null => true
      t.timestamps
    end

    # Add indexes
    add_index :admin_jobs, :name, :unique
    add_index :admin_jobs, :code, :unique
    add_index :admin_jobs, :job, :unique
  end

  def self.down
    drop_table :admin_jobs
  end
end
