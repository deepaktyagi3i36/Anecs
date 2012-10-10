# = Entity description
#
# ClearSessionsJob is an entity that delets all old sessions. The old session is a session
# updated more or equal N days before. Time of update difined by timestamp property of sessions
# table. Number of days N defined in runtime_settings table by value of session_expire_timeout field.
#
# == Link

class ClearSessionsJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("clear_sessions_job")
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

      clear_sessions

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
  # TODO; refactor this code after fix problem with session
  # Here is workaround: Erase after change work with session
  # Mysql::Error: Cannot delete or update a parent row: a foreign key constraint fails
  # (`wellness_applp/shopping_carts`, CONSTRAINT `shopping_carts_session_id_fk` FOREIGN KEY (`session_id`)
  # REFERENCES `sessions` (`id`)): DELETE FROM `sessions` WHERE `id` = 839092
  # The same problem with comparators should be

  # Here the root of the problem:
  # session.rb
  #has_one :shopping_cart,
  #    :conditions => 'user_id is null',
  #    :dependent => :destroy
  #has_one :comparator,
  #    :conditions => 'user_id is null',
  #    :dependent => :destroy
  #
  #count1 = ShoppingCart.count(:conditions => ["user_id is not null and session_id = ?", item.id])
  #count2 = Comparator.count(:conditions => ["user_id is not null and session_id = ?", item.id])
  #next if count1 > 0 || count2 > 0
  #
  def clear_sessions
    # Get rows to fetch
    rows_to_fetch = @runtime_settings["clear_sessions_rows_to_fetch"].to_i
    closed_order_state = OrderState.find_by_code("closed")
    completed_checkout_state = CheckoutState.find_by_code("completed")
    confirmation_checkout_state = CheckoutState.find_by_code("confirmation")

    # Fetch multiple times to avoid out of memory exception
    while true
      timeshift = Time.now - @runtime_settings["session_expire_timeout"].to_i.days
      # resultset = Session.find(:all, :conditions => ['updated_at < ?', timeshift], :limit => rows_to_fetch)
      resultset = Session.find(:all, :conditions => [
          "updated_at < ?
        and not exists(select 1 from shopping_carts t1 where t1.session_id = sessions.id and t1.user_id is not null)
        and not exists(select 1 from comparators t2 where t2.session_id = sessions.id and t2.user_id is not null)
        and not exists(select 1 from orders t3 where t3.session_id = sessions.id and t3.order_state_id != ? and t3.checkout_state_id != ? and t3.checkout_state_id != ? )",
          timeshift, closed_order_state.id, completed_checkout_state.id, confirmation_checkout_state.id], :limit => rows_to_fetch)
      break if resultset.nil? or resultset.size() == 0
      resultset.each do |item|
        Session.destroy(item.id)
      end
      report_iteration(resultset)
      create_iteration(resultset)
      @iteration += 1
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
    message = "Sessions are deleted successfully, ids: " + ids.join(",")
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch,:message => message})
  end
end