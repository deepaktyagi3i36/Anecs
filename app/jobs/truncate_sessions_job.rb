# = Entity description
#
# TruncateSessionsJob is an entity that delets all old sessions. The old session is a session
# updated more or equal N days before. Time of update difined by timestamp property of sessions
# table. Number of days N defined in runtime_settings table by value of session_expire_timeout field.
#
# == Link
#
class TruncateSessionsJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("truncate_sessions_job")
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

      truncate_sessions

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
  def truncate_sessions
      # Delete comparators
      ComparatorItem.delete_all
      Comparator.delete_all

      # Delete shopping carts
      CartItem.delete_all
      ShoppingCart.delete_all

      # Delete orders
      OrderVariantProperty.delete_all
      OrderVariant.delete_all
      Order.delete_all

      # Delete sessions
      Session.delete_all
  end


end