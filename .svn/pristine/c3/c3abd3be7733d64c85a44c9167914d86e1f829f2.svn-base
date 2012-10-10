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
class UpdateCategoriesJob < AdminJobBase
  # ::Rails.logger.error("...")

  def initialize(attributes = nil)
    if(attributes.nil? || attributes[:admin_job_id].nil?)
      job = AdminJob.find_by_code("update_categories_job")
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

      start_recursion

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
  def start_recursion
    Category.find(:all, :conditions => ["parent_id IS NULL"]).each do |root|
      root.save!

      report_iteration(root)
      create_iteration(root)
      continue_recursion(root)
    end
  end

  def continue_recursion(parent)
    Category.find(:all, :conditions => ["parent_id = ?", parent.id]).each do |child|
      child.save!

      report_iteration(child)
      create_iteration(child)
      continue_recursion(child)
    end
  end


  def report_iteration(node)
    ::Rails.logger.info("#{@admin_job.job} job is in progress. " +
      "Iteration #{@iteration}, item id: #{node.id}, item name: #{node.name}")
  end

  def create_iteration(node)
    message = "Category are updated successfully, item id: #{node.id}, item name: #{node.name}"
    AdminJobReport.create!({:admin_job_id => @admin_job_id, :runbatch => @runbatch, :message => message})
  end

end