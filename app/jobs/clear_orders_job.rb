# = Entity description
#
# ClearOrdersJob is an entity which deletes orders stored at orders table.
# Job deletes orders in state before "in progress" with checkout_state before "completed" and
# which had updated later than N hours ago (2 hours by default). N is defined in runtime_settings table by
# order_expire_timeout parameter.
#

class ClearOrdersJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("clear_orders_job")
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

      clear_orders

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
  def clear_orders
    # Get rows to fetch
    rows_to_fetch = @runtime_settings["clear_orders_rows_to_fetch"].to_i

    # Fetch multiple times to avoid out of memory exception
    while true
      timeshift = Time.now - @runtime_settings["order_expire_timeout"].to_i.days
      avaible_states = OrderState.find_all_by_code(['inprogress', 'accepted']).collect(&:id)
      checkout_state = CheckoutState.find_by_code('completed')
      resultset = Order.find(:all,
        :conditions => ['updated_at < ? and checkout_state_id <> ? and order_state_id not in (?)', timeshift, checkout_state.id, avaible_states],
        :limit => rows_to_fetch)
      break if resultset.nil? or resultset.size() == 0
      resultset.each do |item|
        Order.destroy(item.id)
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
    message = "Orders are deleted successfully, ids: " + ids.join(",")
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end
end