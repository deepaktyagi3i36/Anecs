# = Entity description
#
# Saleoff is en entity that contain information about saleoff such name and short description.
# There are a sale offs to sell a product with discount sometimes. Saleoff store at this tables.
# Product that included into saleoff are localted at saleoff_product table.
#
# == Link
#
#
# == Table information
# Quantity of record will grow during lifetime, I expect 100-1000 records
#
#
class ValidateSystemJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("validate_system_job")
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

      validate_payments_types

      validate_shipping_types

      validate_outposts

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
  # At least one payment type should be enabled
  def validate_payments_types
    # TODO:
  end

  # At least one shipping type should be enabled
  def validate_shipping_types
    # TODO:
  end

  # If selfout shipping type is enabled then should be
  # at least one selfout for each region
  def validate_outposts
    # TODO:
  end

end