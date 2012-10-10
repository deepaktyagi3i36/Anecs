class AdminJobReportFilter < Tableless31Model
  # ::Rails.logger.error("...")

  column :created_at_since, :datetime
  column :created_at_till, :datetime

  #
  def self.delayed_last_runbatch
    proc { "admin_job_reports.runbatch = (select max(ajr.runbatch) from admin_job_reports ajr where ajr.admin_job_id = #{self.id} )" }
  end

  #
  def self.last_runbatch(admin_job_id)
    ['admin_job_reports.runbatch = (select max(ajr.runbatch) from admin_job_reports ajr where ajr.admin_job_id = ? )'. admin_job_id]
  end

end
