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
class UpdateRatingJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("update_rating_job")
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

end