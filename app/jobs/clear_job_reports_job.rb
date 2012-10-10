# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ClearJobReportsJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("clear_job_reports_job")
      if job
        if(attributes.nil?)
          attributes = {:admin_job_id => job.id}
        end
        if(attributes[:admin_job_id].nil?)
          attributes.merge!({:admin_job_id => job.id})
        end
      end
    end
    super(attributes)
  end

  def perform

    begin
      report_started

      setup_begin_at

      setup_runbatch

      load_runtime_settings

      clear_reports

      create_finished

      report_finished

      setup_success

    rescue Exception => e
      report_failure(e)

      setup_failure(e)
    end

    email_finished
  end

  private
  def clear_reports
    # Get rows to fetch
    rows_to_fetch = @runtime_settings["clear_job_reports_rows_to_fetch"].to_i

    # Iterate accrross all jobs
    admin_jobs = AdminJob.find(:all)
    admin_jobs.each do |admin_job|
      # Seach last run batch (erase while batch)
      timeshift = Time.now - @runtime_settings["job_report_expire_timeout"].to_i.days
      runbatch = AdminJobReport.maximum("runbatch", :conditions => ["admin_job_id = ? and updated_at < ?", admin_job.id, timeshift])
      next if runbatch.nil?

      # Fetch multiple times to avoid out of memory exception
      while true
        resultset = AdminJobReport.find(:all, :conditions => ['admin_job_id = ? and runbatch <= ?', admin_job.id, runbatch], :limit => rows_to_fetch)
        break if resultset.nil? or resultset.size() == 0

        # Special case: this job and job_report_expire_timeout is 0
        next if admin_job.id == @admin_job_id && runbatch == @runbatch

        # Delete all records
        resultset.each do |item|
          AdminJobReport.destroy(item.id)
        end
        report_iteration(resultset)
        create_iteration(resultset)
        @iteration += 1
      end
    end
  end

  def report_iteration(resultset)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "Iteration #{@iteration}, resultset size: #{resultset.size}")
  end

  def create_iteration(resultset)
    ids = []
    resultset.each do |item|
      ids << item.id
    end
    message = "Admin job reports are deleted successfully, ids: " + ids.join(",")
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end
end