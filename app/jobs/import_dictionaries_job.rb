# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ImportDictionariesJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("import_dictinaries_job")
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

      import_dictinaries

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
  def import_dictinaries
  end

end