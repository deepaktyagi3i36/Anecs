class CreateAdminJobReports < ActiveRecord::Migration
  def self.up
    create_table :admin_job_reports do |t|
      t.column :admin_job_id, :integer, :null => false
      t.column :runbatch, :integer, :null => false
      t.column :message, :string, :limit => 5000, :null => false
      t.timestamps
    end

    # Add foreign keys
    add_foreign_key :admin_job_reports, :admin_jobs, :column => "admin_job_id"
  end

  def self.down
    drop_table :admin_job_reports
  end
end
